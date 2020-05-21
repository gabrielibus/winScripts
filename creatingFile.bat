@ECHO off
setlocal EnableDelayedExpansion
title Instalador Virus

REM VARIABLES
set /a actualLevel=0
set level[00]=basics office desing games
set level[11]=compressTools chrome frameworks 7zip otros volver
set level[12]=office1010 office2013 office1060 office2019 ProjetYVisio activadore volver
set level[13]=Adobe Autodesk Rhino Chaos Otros volver

set level[21]=winzip32 winzip64 7zip
set level[22]=chrome32
set level[23]=frmawrks64


REM `siguiente level[+1,userInput!=0]
REM anterior level[-1x2]

call :start

REM Styles and Input
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
    goto :eof

:separadorOut
    echo ____________________________
    goto :eof

REM Start function




:start
set /a level=0
    call :listMenu %level[00]%
    call :next

REM Functions
REM LISTMENU. param: array for print, return user selected option
:listMenu 
    call :intro
    set array=%1 %2 %3 %4 %5 %6 %7 %8 %9
    set /a cont=1
    call :separadorIn
    echo.
        for %%i in (%array%) do (
        echo [!cont!]. %%i
        set /a cont= !cont!+1)
    call :separadorOut
    echo.
    call :userInput
    goto :eof



REM NEXT. param: userInput

:next
    if not %userInput%==0 (
        set /a level+=1
        set algo=!level!%userInput%
        set nextStep=level[!level!!userInput!]
        )
    if %userInput%==0 (
        set /a level-=1
        set nextStep=level[!level!!level!]
        )
        echo siguiente nivel sera %nextStep%
        pause >nul
    call :listMenu !%nextStep%!
    call :next

REM Hasta aquí funciona perfectamente el buccle de autollamado ESTES!!!!!!!!!!!!!

pause