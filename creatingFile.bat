@ECHO off
setlocal EnableDelayedExpansion
title Instalador Virus

echo    ***Bienvenido Virus***
echo       virustaller v0.1  
echo.

REM VARIABLES
set prg01=InstaladoresBasicos
set prg02=Ofimatica
set prg03=DisegnoAndCad
set root01= %prg01% %prg02% %prg03%

call :listOptions %root01%
https://stackoverflow.com/questions/10166386/arrays-linked-lists-and-other-data-structures-in-cmd-exe-batch-script
:listOptions
setlocal
echo Elija la opcion deseada
echo.
set array=%1
for %%i in (1, 1, 25) do(
    echo %%i
)
echo esto es el array %1 %2 %3 %4 %5 %6 %7 %8 %9 %10
call :listMenu
set/p opcion=  Escriba un numero:  
endlocal & set next=0%opcion%
goto %next%

:listMenu 
setlocal
    set /a cont=1
    echo ____________________________
    echo.
    for %%i in (%array%) do (
    echo [!cont!]. %%i
    set /a cont= !cont!+1
    )
    echo.
    echo ____________________________
    endlocal & echo.
    goto :eof


REM :listOptions
REM echo Elija la opcion deseada
REM echo.
REM set array=%root01%
REM call :listMenu
REM set/p opcion=  Escriba un numero:  
REM set next=0%opcion%
REM goto %next%

REM :listMenu 
REM setlocal
REM     set /a cont=1
REM     echo ____________________________
REM     echo.
REM     for %%i in (%array%) do (
REM     echo [!cont!]. %%i
REM     set /a cont= !cont!+1
REM     )
REM     echo.
REM     echo ____________________________
REM     endlocal & echo.
REM     goto :eof

REM echo Elija una opcion:
REM echo.
REM echo [1]. 7-zip
REM echo [2]. Chrome
REM echo [3]. Winrar
REM echo [4]. Reader basico
REM echo [5]. 
REM echo [6].
REM echo [8].
REM echo [9].
REM echo [b]. Back
REM set/p opcion=  Escriba un numero:  
REM set next=1%opcion%
REM goto %next%

REM :02
REM cls
REM echo Offimatica
REM echo.
REM echo [1]. Desinstalar office completamente
REM echo [2]. Office 2007
REM echo [3]. Office 2013
REM echo [4]. Office 2016
REM echo [5]. Office 2019
REM echo [6]. Project y Visio 2016/19
REM echo [8]. Activar office
REM echo [9]. Open Office
REM echo [b]. Back
REM pause >nul

REM REM :b
REM REM cls
REM REM goto star

pause