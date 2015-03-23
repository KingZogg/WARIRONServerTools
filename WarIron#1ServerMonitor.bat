::Made by eRazeri
@echo off
:start
C:\Windows\System32\tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | C:\Windows\System32\find /I /N "arma3server.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
echo Server monitored is not running, will be started now 

start "" /wait restart.bat

echo Server started succesfully
goto started
:loop
cls
echo Server is already running, running monitoring loop
:started
C:\Windows\System32\timeout /t 30
C:\Windows\System32\tasklist /FI "IMAGENAME eq arma3server.exe" 2>NUL | C:\Windows\System32\find /I /N "arma3server.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
C:\Windows\System32\taskkill /im arma3server.exe
goto start