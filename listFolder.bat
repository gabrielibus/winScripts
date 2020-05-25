echo off
setlocal enabledelayedexpansion
color 0e

DIR /b /A:D-S-H > temp.txt

:start
    call :listFolders

:listFolders
    SET cont=1
    cls
    echo.
    echo        *** VIRUS INSTALLER ***
    echo _______________________________________
    echo.
    echo Folder: %CD%
    echo _______________________________________
    echo.
    for /f "tokens=*" %%i in (temp.txt) do (
        SET folder-!cont!=%%i
        echo [!cont!]. %%i
        SET /A cont+=1
        )
    echo [0]. Volver
    echo.
    call :userInput

:userInput
    setlocal enabledelayedexpansion
    SET /P choise=Seleccione un numero: 
    if %choise%==0 (
        CD..
        )
    if not %choise%==0 (
        CD !folder-%choise%!
        )
    DIR /b /A:D-S-H > temp.txt
    call :listFolders

    pause

    goto :listFolders
    REM if %choise%==
    REM DIR %next_folder% /A:A /b 
    pause
