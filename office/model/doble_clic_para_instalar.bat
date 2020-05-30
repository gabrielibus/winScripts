Echo off
title COMPUFACILITO
SET version=Office
SET nombre=office2019enterprise-x64.xml
SET zip=office_full_64.zip

FOR /F %%I IN ("%0") DO SET actual_path=%%~dpI


color 3f

cls
echo.                        ===========================================
echo.                                       COMPUFACILITO    
echo.                        ===========================================
echo.
echo                       Descargando %version%, tenga un poco de paciencia.
echo.
echo          En unos minutos saldra una aviso solicitando permiso para instalar %version%. 
echo               IMPORTANTE: cuando salga el aviso haga click en SI para instalar.
echo.

:: downloading files
setup.exe /download %nombre%

echo                 El instalador de %version% se ha descargado correctamente.
echo.

setup.exe /configure %nombre%

del /a /s /q %actual_path%\setup.exe >nul
rmdir /s /q %actual_path%\Office >nul
del /a /s /q %actual_path%\%nombre% >nul
del /a /s /q %actual_path%\%zip% >nul

timeout /t 5 /nobreak
del "%~f0"
echo.

exit