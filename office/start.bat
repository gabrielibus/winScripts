echo off
setlocal enabledelayedexpansion
color 0e

SET cont=1
call :import config.ini
call :print_menu 
SET /P input=Escriba un numero: 
call :start_download
pause

:import file
    for /f "tokens=*" %%i in (%1%) do (
        SET %%i
    )
    goto :eof

:print_menu
    if defined menu%cont% (
    echo [!cont!]. !menu%cont%!
        SET /a cont+=1
        call :print_menu
    )
    echo.
    goto :eof

:start_download
    cls
    echo ...downloading !menu%input%! in progress
    %installer% !option%input%! !command%input%!
    %installer% /configure !command%input%!
    echo Instalacion finalizada. Ya puede activar sus productos office.
    goto :eof