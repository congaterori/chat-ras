@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
    goto next
) else (
    echo you must open this file as administrator && pause && exit
)
:next
netsh advfirewall firewall add rule name="FTP" dir=in action=allow program=%SystemRoot%\System32\ftp.exe enable=yes protocol=tcp
netsh advfirewall firewall add rule name="FTP" dir=in action=allow program=%SystemRoot%\System32\ftp.exe enable=yes protocol=udp