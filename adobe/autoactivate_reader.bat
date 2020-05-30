echo off

SET patch_path="C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat"

::===========================================================================
fsutil dirty query %systemdrive%  >nul 2>&1 || (
echo ==== ERROR ====
echo Por favor abra con click derecho, "ejectutar como administrador"
echo.
echo Presione cualquier tecla para finalizar...
pause
exit
)
::===========================================================================


del /a /s /q %patch_path%\amtlib.dll >nul
copy %patch_path%\amtlib_bk.dll %patch_path%\amtlib.dll

REM debo determinar cuál es la tarea que no deja que el adobe vuelva a fucnioanr después de cambiar el amtlib.dll. Hay que matarla.
REM taskkill /f /im "cmd.exe" >nul
REM taskkill /f /im "cmd.exe" >nul
REM taskkill /f /im "cmd.exe" >nul
pause
exit