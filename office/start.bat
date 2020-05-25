echo off
setlocal enabledelayedexpansion

:: setting each config.ini variable
SET cont=1
for /f "tokens=*" %%i in (config.ini) do (
            SET %%i
            call :test 
        )

SET /P input=Escriba un numero: 
call :start

pause

:test
    if defined menu%cont% (
    echo [!cont!]. !menu%cont%!
        SET /a cont+=1
    )
    goto :eof

:start
    cls
    echo ...downloading !menu%input%! in progress
    %installer% !option%input%! !command%input%!
    REM %installer% /configure 

