@echo off
title Te Amo
echo ***BIENVENIDA A ESTA AVENTURA***
echo.
echo Voy a necesitar alguna informacion 
echo sobre ti para poder continuar.
echo.
pause >null
echo Dime como quieres que te llame?
set/p nickName=  
echo.
echo BIENVENIDO, %nickName%!
echo.
echo En cuanto tiempo quieres 
echo que ponga otro exitante 
echo capitulo de Dragon Ball, %nickName%?
echo. 
echo Selecciona una opcion:
echo.
echo 1. 15 minutos
echo 2. 30 minutos
echo 3. 45 mintuos
echo 4. Ahora mismo. Maldita sea!!!
echo.
set/p tiempo=Escribe un numero del 1 al 4 y presiona ENTER  
pause >null
exit