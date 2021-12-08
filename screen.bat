@echo off
title screen
color a
set /A num=0
:loop
set /A num=%num%+1
echo open chatras.ddns.net > setscreen.txt
echo user pi raspberry >> setscreen.txt
echo binary >> setscreen.txt
echo get %num%.dat >> setscreen.txt
echo bye >> setscreen.txt
:loop2
start /min startscreen.bat
timeout 2 > nul
if not exist .\%num%.dat goto loop2
type .\%num%.dat
goto loop
