@echo off
title send
color a
for /f "delims=" %%x in (%temp%\location.txt) do set location=%%x
::cd C:\Users\DELL\Desktop\chatras
cd %location%
if not exist box mkdir box
for /f "delims=" %%x in (.\name.txt) do set name=%%x
:loop
cls
setlocal enabledelayedexpansion
set max=0
for %%x in (*.dat) do (
  set "FN=%%~nx"
  set "FN=!FN:version-=!"
  if !FN! GTR !max! set max=!FN!
)
set /A send=%max%+1
cls
set /p enter=enter: 
setlocal enabledelayedexpansion
set max=0
for %%x in (*.dat) do (
  set "FN=%%~nx"
  set "FN=!FN:version-=!"
  if !FN! GTR !max! set max=!FN!
)
set /A send=%max%+1
echo %name%: %enter% > box\%send%.dat
echo open chatras.ddns.net > setsend.txt
echo user pi raspberry >> setsend.txt
echo binary >> setsend.txt
echo put box\%send%.dat >> setsend.txt
echo bye >> setsend.txt
ftp -n -s:setsend.txt
Del box\%send%.dat
::start /min startsend.bat
goto loop
