Echo off
setlocal enabledelayedexpansion
SET cosa1=test1
SET cosa2=test2

SET id=2
SET temp=cosa%id%
echo !%temp%!
endlocal
