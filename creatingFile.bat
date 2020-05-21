@ECHO off
setlocal EnableDelayedExpansion
title Instalador Virus

REM VARIABLES
set level[0]=InstaladoresBasicos Ofimatica CADyDisegno
set level[1]=winzip chrome frameworks 7zip otros volver
set level[2]=office1010 office2013 office1060 office2019 ProjetYVisio activadore volver
set level[3]=Adobe Autodesk Rhino Chaos Otros volver


call :start

:intro
    echo    ***Bienvenido Virus***
    echo       virustaller v0.1  
    echo.
    goto :eof

:userInput
        set/p userInput=  Escriba un numero:  
        goto :eof 

:separadorIn
    echo ____________________________
    echo.
    goto :eof

:separadorOut
    echo.
    echo ____________________________
    goto :eof


REM Start function
:start
    call :intro
    call :listMenu %level[0]%

:listMenu 
    setlocal
    set array=%1 %2 %3 %4 %5 %6 %7 %8 %9
        set /a cont=1
    call :separadorIn
        for %%i in (%array%) do (
        echo [!cont!]. %%i
        set /a cont= !cont!+1
        )
        echo.
        echo [0]. Go back
    call :separadorOut
        endlocal & echo.
        call :userInput
        cls
        endlocal & call :next %userInput%

:next
    setlocal
    set nextStep=!level[%1%]!
    call :listMenu %nextStep%

pause