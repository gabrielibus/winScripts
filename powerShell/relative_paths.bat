@echo off
echo %%~dp0 is "%~dp0"
echo %%0 is "%0"
echo %%~dpnx0 is "%~dpnx0"
echo %%~f1 is "%~f1"
echo %%~dp0%%~1 is "%~dp0%~1"

rem Temporarily change the current working directory, to retrieve a full path 
rem   to the first parameter
pushd .
cd %~dp0
echo batch-relative %%~f1 is "%~f1"
popd
pause