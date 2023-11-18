@echo off
setlocal enabledelayedexpansion
title Snake Game
mode con cols=40 lines=15
color 2

set "settings= SETTINGS "
set "play=[PLAY]"
set "scores= SCORES "

set /a selected=2
set "location=menu"
set /a delay=0

set "name= NAME "



::GAME LOOP
:gameloop

if !location!==menu (
    call :menu
    set /a delay=1
    cls
)
if !location!==settings (
    set /a delay=1
    call :settings
    cls
)

call :timer !delay!
goto gameloop
::#####################



::TIMER
:timer
    set /a t=0
    :timerloop
    set /a t+=1
    if !t!==%1 exit /b
    goto timerloop
::####################



::MENU | GAME | SCORES
:menu
    echo.
    echo.
    echo             _____________
    echo            ^|____MENU____^|
    echo.
    echo            ^|------------^|
    echo            ^| %settings% ^|
    echo            ^|   %play%   ^|
    echo            ^|  %scores%  ^|
    echo            ^|------------^|
    echo.
    echo.
    choice /c 82eqn /d n /t 1 /n /m "(8=up | 2=down | e=enter | q=quit): "
    call :menu_choice
    exit /b

:settings
    echo.
    echo.
    echo             _____________
    echo            ^|__SETTINGS__^|
    echo.
    echo            ^|------------^|
    echo            ^|   %name%   ^|
    echo            ^|            ^|
    echo            ^|------------^|
    echo.
    echo.
    choice /c 82eqn /d n /t 1 /n /m "(8=up | 2=down | e=enter | q=quit): "
    exit /b
::###############################################################


::MENU PROPERTIES
:menu_choice
    if !errorlevel!==1 (
        if !selected! LSS 3 (
            set /a selected+=1
            call :menudisplay
        )
    ) else if !errorlevel!==2 (
        if !selected! GTR 1 (
            set /a selected-=1
            call :menudisplay
        )
    ) else if !errorlevel!==3 (
        if !selected!==3 set "location=settings"
        if !selected!==2 set "location=play"
        if !selected!==1 set "location=scores"
    ) else if !errorlevel!==4 (
        cls
        set "goodbye=Good Bye :) <3..."
        echo.
        echo.
        echo.
        echo.
        echo.
        echo.
        echo            !goodbye!
        call :timer 300
        exit
    )
    exit /b

:menudisplay
    set "settings= SETTINGS "
    set "play= PLAY "
    set "scores= SCORES "
    if !selected!==3 set "settings=[SETTINGS]"
    if !selected!==2 set "play=[PLAY]"
    if !selected!==1 set "scores=[SCORES]"
    exit /b
::############################################

::SETTINGS PROPERTIES
:settings_choice
    if !errorlevel!==1 (
        if !selected! LSS 3 (
            set /a selected+=1
            call :settingsdisplay
        )
    ) else if !errorlevel!==2 (
        if !selected! GTR 1 (
            set /a selected-=1
            call :settingsdisplay
        )
    ) else if !errorlevel!==3 (
        if !selected!==3 set "location=name"
        if !selected!==2 set "location=play"
        if !selected!==1 set "location=scores"
    ) else if !errorlevel!==4 (
        cls
        set "goodbye=Good Bye :) <3..."
        echo.
        echo.
        echo.
        echo.
        echo.
        echo.
        echo            !goodbye!
        call :timer 300
        exit
    )
    exit /b

:settingsdisplay
    set "name= NAME "
    exit /b
