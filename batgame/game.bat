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

set "user=NAME"
set "name=[%user%]"
set "size= SIZE "
set "colors= COLORS "



::GAME LOOP
:gameloop
cls
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
    echo            ^| !settings! ^|
    echo            ^|   !play!   ^|
    echo            ^|  !scores!  ^|
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
    echo            ^|   !name!   ^|
    echo            ^|   !size!   ^|
    echo            ^|  !colors!  ^|
    echo            ^|------------^|
    echo.
    echo.
    choice /c 82eqn /d n /t 1 /n /m "(8=up | 2=down | e=enter | q=quit): "
    call :settings_choice
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
        if !selected!==3 (
            set /p "user=Name(Enter to confirm): "
            set "user=!user:~0,4!"
            call :settingsdisplay
        )
        if !selected!==2 echo.
        if !selected!==1 echo.
    ) else if !errorlevel!==4 (
        set "location=menu"
    )
    exit /b

:settingsdisplay
    set "name= !user! "
    set "size= SIZE "
    set "colors= COLORS "
    if !selected!==3 set "name=[!user!]"
    if !selected!==2 set "size=[SIZE]"
    if !selected!==1 set "colors=[COLORS]"
    exit /b
