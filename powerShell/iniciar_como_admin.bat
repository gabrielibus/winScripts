echo off
setlocal enabledelayedexpansion
SET name=nombre del programa instalado
SET file=%~dp0urls.txt
SET id_=1Ep1UWl6u4BXixTlQK7FZIHlNLgaF5nNF
SET destino=temp1.zip
SET zipPassword=compufacilito
SET installer=Set-up.exe

SET url="https://drive.google.com/uc?export=download'&'id=%id_%"
cls

call :install_7zip
call :download_software
call :install_software
call :block_host                         
pause
cls
echo Desea eliminar los archivos de instalacion?
set /p next=(y/n): 
if %next%==y (call :clear_temp)
pause
exit

:download_software
    ::download software
    PowerShell.exe -executionpolicy remotesigned Invoke-WebRequest -Uri !url! -outfile %~dp0%destino%
    echo %name% downloaded successfull!
    ::unzip file
    "C:\Program Files (x86)\7-Zip\7z.exe" x -p%zipPassword% -y -o%~dp0\install %~dp0%destino%
    echo %name% unziped successfull!
    goto:eof
::
:install_7zip
    PowerShell.exe -executionpolicy remotesigned Invoke-WebRequest -Uri "https://www.7-zip.org/a/7z1900.exe" -outfile %~dp0\7zip.exe
    start /wait %~dp0\7zip.exe /S
    echo 7-zip installed successfull!
    goto:eof
::
:install_software
    call %~dp0\install\%installer% --silent --ADOBEINSTALLDIR="C:\InstallDir" INSTALLLANGUAGE=es_es
    goto:eof
::
:block_host
    FOR /f "tokens=*" %%i in (%file%) do (
        echo %%i >> C:\Windows\System32\drivers\etc\hosts
        echo %%i
    )
    echo ________________________________________________________
    echo.
    echo added successfully...
    goto:eof
::
:clear_temp
    rmdir /s /q %~dp0\install >nul
    del /a /s /q %file%

    timeout /t 5
    del "%~f0"
    echo.
    pause
    exit
::