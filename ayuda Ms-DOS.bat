@echo off
color 0A
title ayuda MS-DOS
echo Ayuda Virus MS-DOS!
echo.

set volver=presione cualquier tecla para regresa al menu anterior.

:start
echo Elija la opcion deseada para obtener ayuda:
echo.

echo 1. Definicion de variables
echo 2. Condicionales
echo 3. Table de colores
echo 4. Comparadores
echo.
set/p select=presione la opcion deseada (1,2): 
cls
goto %select%

:1
echo Como definir variables:
echo 	por ejemplo: -> set var=valor asignado
echo.
echo Variables ingresadas por el usuario:
echo 	set/p var=mensaje para el usuario:
echo Operaciones con variables
echo 	set/a var=velocidad / tiempo
echo.
echo %volver%
pause >nul
goto start

:2
echo Definir condicionales if o if not
echo	if %var%==0 (condicion) else (condicion)
echo.
echo %volver%
pause >nul
goto start

:3
echo Tabla de colore
echo.
pause >nul
goto start

:4
echo Comparadores
echo.
echo a MENOR b: a LSS b
echo a MAYOR b - a GTR b
echo a MenorIgual b - a LEQ b
echo a MayorIgual b - a GEQ b
pause >nul
goto start