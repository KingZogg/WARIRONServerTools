::Made by eRazeri
@echo off

timeout 30

:start
C:\Windows\System32\tasklist /FI "IMAGENAME eq arma3serverHC.exe" 2>NUL | C:\Windows\System32\find /I /N "arma3serverHC.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
echo WarIron#1 Headless client is not running, will be started now 

Start "" C:\Games\Arma3\WI_1\arma3serverHC.exe -client -password= -connect=127.0.0.1 -port=2302 -name=headlessclient

echo WarIron#1 Headless client started succesfully
goto started
:loop
cls
echo WarIron#1 Headless client is already running, running monitoring loop
:started
C:\Windows\System32\timeout /t 30
C:\Windows\System32\tasklist /FI "IMAGENAME eq arma3serverHC.exe" 2>NUL | C:\Windows\System32\find /I /N "arma3serverHC.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
C:\Windows\System32\taskkill /im arma3serverHC.exe
goto start