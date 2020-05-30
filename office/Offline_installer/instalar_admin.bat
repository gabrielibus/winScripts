echo off
cls
color 0a

FOR /F %%I IN ("%0") DO SET actual_path=%%~dpI

call %actual_path%\configure.bat
call %actual_path%\activar.cmd
goto:eof
