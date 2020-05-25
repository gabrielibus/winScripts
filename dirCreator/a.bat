echo off
setlocal enabledelayedexpansion
color 0e

SET local_path=%cd%\
SET level=0
DIR /b /A:D > temp.txt

:start
    SET actual_path=%local_path%
    call :listFolders





:listFolders
    SET cont=1
    for /f "tokens=*" %%i in (%actual_path%temp.txt) do (
        SET folder-%level%!cont!=%%i
        echo [!cont!]. %%i
        SET /A cont+=1
        )
    echo [x]. Volver
    echo.
    call :userInput
    goto :eof

:userInput
    SET /P choise=Seleccione un numero:   
    SET actual_path=%actual_path%!folder-%level%%choise%!\
    DIR !actual_path! /b /A:D > !actual_path!temp.txt

    pause

    goto :listFolders
    REM if %choise%==
    REM DIR %next_folder% /A:A /b 
    pause
