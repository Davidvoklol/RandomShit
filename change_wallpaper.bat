@echo off
setlocal enabledelayedexpansion

set "img=windows10.jpg rickandmorty.jpg darkwindows.jpg"
set "URL=C:\Users\david\Desktop\Pictures\Backgrounds"
set "REGURL=HKEY_CURRENT_USER\Control Panel\Desktop"

set /a counter=0

:loop
set /a counter+=1
if !counter!==4 set /a counter=1

call :timer 1000
cls

set /a index=0
for %%f in (%img%) do (
    set /a index+=1
    RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters
    if !index!==!counter! (
        call :REG %%f
    )
)
goto loop

exit
:REG
    REG ADD "%REGURL%" /v WallPaper /t "REG_SZ" /d "%URL%\%1" /f >nul
    echo %1
    ::REG QUERY "%REGURL%" /v WallPaper
    exit /b

:timer
    set /a t=0
    :timeloop
    set /a t+=1
    ::RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters
    if !t! neq %1 goto timeloop
    exit /b