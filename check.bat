@powershell -window hidden -command ""
setlocal enableextensions enabledelayedexpansion
set ipaddr=chatras.ddns.net
:loop
set state=off
for /f "tokens=5,6,7" %%a in ('ping -n 1 !ipaddr!') do (
    if "x%%b"=="xunreachable." goto :endloop
    if "x%%a"=="xReceived" if "x%%c"=="x1,"  set state=on
)
:endloop
if %state% == on goto exit
msg * the server is %state%
:exit
endlocal
exit