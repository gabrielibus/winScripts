@ECHO off
setlocal enabledelayedexpansion
color 0e
SET del_position=0

call config.bat

call :date_now
call :create_folders
SET cont=0
SET start_time=%now%

:loop
    cls
    call :calc_free_space
    call :msj
    call :recordCam 1
    call :recordCam 2
    call :recordCam 3
    call :recordCam 4
    call :stop_record
    call :setlog
    goto :loop

:recordCam id
    SET id=%~1
    call :date_now
    SET file_name[%cont%]=%rootLetter%\%folder%\!cam%id%_name!\!cam%id%_name!-%now%.mpg
    SET options=-vvv !cam%id%_url! --sout "#file{dst=!file_name[%cont%]!,no-overwrite}"
    start "titulo" "%vlcPath%\vlc.exe" %params% %options%  
    echo !cam%id%_name! start recording succsseful
    echo file: %del_file% deleted!>>log.txt
    SET del_file=!file_name[%del_position%]!
    if %cont%==%max% (
        del %del_file%
        SET /a del_position+=1
        SET /a max+=1
        echo %del_file% %del_position% %max% >> log.txt
        pause
        )
    goto :eof

:date_now
    for /F "tokens=2" %%i in ('date /t') do SET date=%%i
    SET day=%date:~0,2%
    SET month=%date:~3,2%
    SET year=%date:~6,4%
    SET hour=%time:~0,2%
    SET minute=%time:~3,2%
    SET second=%time:~6,2%
    SET now=%day%-%month%-%year%_%hour%-%minute%-%second%
    goto :eof

:calc_free_space
    REM @setlocal enableextensions enabledelayedexpansion
    for /f "usebackq delims== tokens=2" %%x in (`wmic logicaldisk where "DeviceID='%rootLetter%'" get FreeSpace /format:value`) do SET FreeSpace=%%x
    SET /a kb=%FreeSpace:~0,-4%
    SET /a mb = kb/1024
    SET /a gb = mb/1024
    goto :eof

:create_folders
    if not exist "%rootLetter%\%folder%\%cam1_name%" mkdir "%rootLetter%\%folder%\%cam1_name%"
    if not exist "%rootLetter%\%folder%\%cam2_name%" mkdir "%rootLetter%\%folder%\%cam2_name%"
    if not exist "%rootLetter%\%folder%\%cam3_name%" mkdir "%rootLetter%\%folder%\%cam3_name%"
    if not exist "%rootLetter%\%folder%\%cam4_name%" mkdir "%rootLetter%\%folder%\%cam4_name%"
    goto :eof

:msj
        ECHO ==================================================================
        ECHO Espacio libre en el disco %rootLetter% - %gb%GB / %mb%MB / %kb%KB
        if %gb% lss 10 @ECHO ATENCION!!!: %gb% disponibles en el disco.
        ECHO Unidad de grabacion: %rootLetter%/%folder%
        ECHO Fecha y hora de inicio: %day%-%month%-%year%, %hour%:%minute%:%second% %timezone%
        ECHO ==================================================================
        goto :eof

:setlog
    SET start=""
    if %cont%==0 (echo Hora de inicio: %start_time% %timezone% >> log.txt)
    if not %cont%==0 (echo cicle %cont% succsseful >> log.txt )
    SET /a cont+=1
    goto :eof
    
:stop_record
    timeout /t %record_time% >nul
    taskkill /f /im "vlc.exe" 
    goto :eof


    