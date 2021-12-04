@echo off
title chat raspberry pi
color a
cls
cd > %temp%\location.txt
if not exist 0.dat echo > 0.dat
if not exist name.txt goto name
if not exist box mkdir box
goto next
:name
echo do not put unicode in your name
set /p name=what is your name: 
echo %name% > name.txt
goto next
:next
cls
echo loading...
start screen.bat
powershell -command "Start-Process send.bat -Verb runas"
exit