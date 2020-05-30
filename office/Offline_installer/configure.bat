echo off
title Office ultima version COMPUFACILITO
cls
setlocal enabledelayedexpansion
color 0a

FOR /F %%I IN ("%0") DO SET actual_path=%%~dpI

SET cont=1
::import file
for /f "tokens=*" %%i in (%actual_path%\config.ini) do (
    SET %%i
)

echo                             ======================================================
echo                                                   COMPUFACILITO    
echo                             ======================================================
echo.
call :print_menu
echo.
SET /P input=.                           Escriba un numero: 
call :start_download
goto:eof



:print_menu
    if defined menu%cont% (
    echo                             [!cont!]. !menu%cont%!
        SET /a cont+=1
        call :print_menu
    )
    goto :eof

:start_download
    cls
    echo ...installing !menu%input%! in progress
    REM %installer% !option%input%! !command%input%!
    %installer% /configure !command%input%!
    echo Instalacion finalizada. Ya puede activar sus productos office.
    goto :eof
