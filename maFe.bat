@echo off
title Te Amo
color 0A
echo ***BIENVENIDA A ESTA AVENTURA***
echo.
echo Voy a necesitar alguna informacion 
echo sobre ti para poder continuar.
echo.
pause >null
echo Dime como quieres que te llame?
set/p nickName=  
echo.
cls
echo BIENVENIDO, %nickName%!
echo.
echo En cuanto tiempo quieres 
echo que ponga otro exitante 
echo capitulo de Dragon Ball, %nickName%?
echo. 
echo Selecciona una opcion:
echo.
echo 1. 5 minutos
echo 2. 10 minutos
echo 3. 15 mintuos
echo 4. Ahora mismo. Maldita sea!!!
echo.
set/p tiempo=Escribe un numero del 1 al 4 y presiona ENTER:  
echo.  
echo Cual capitulo quieres reproducir?
set/p capitulo=  
cls
echo %nickName%, reproducire Dragon Ball, capitulo %capitulo%


goto %tiempo%

:1
echo opcion1
:2
echo opcion2
:3
echo opcion3
:4
echo opcion4

pause
exit