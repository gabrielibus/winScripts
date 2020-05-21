@ECHO off
setlocal EnableDelayedExpansion
title Instalador Virus

REM VARIABLES
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



set param[0]=root

:start
    set /a level=0
    set title=root
    call :listMenu %level[00]%
    call :next

REM Functions
REM LISTMENU. param: array for print, return user selected option
:listMenu 

    
    call :intro

    set param[1]=%1
    set param[2]=%2
    set param[3]=%3
    set param[4]=%4
    set param[5]=%5
    set param[6]=%6
    set param[7]=%7
    set param[8]=%8
    set param[9]=%9

    set array=%1 %2 %3 %4 %5 %6 %7 %8 %9
    set /a cont=1
    call :separadorIn
    echo. 
    echo %title%
    call :separadorIn
    echo.
        for %%i in (%array%) do (
        echo [!cont!]. %%i
        set /a cont= !cont!+1)
    call :separadorOut
    echo.
    call :userInput
    goto :eof


:next
    set temp=param[%userInput%]
    REM if %userInput%==0 (set title=%param[0]%)
    REM if not %userInput%==0 (set title=%title% / !param[%userInput%]!)

    if not %userInput%==0 (
        set /a level+=1
        set nextStep=level[!level!!userInput!]
        set title=!param[%userInput%]!
        )
    if %userInput%==0 (
        set /a level-=1
        if !level! LEQ 0 (set /a level=0)
        set nextStep=level[!level!!level!]
        set  title=%param[0]%
        )
    REM set param[0]=%title%
        
    
    call :listMenu !%nextStep%!
    call :next

pause