@echo off
:: Modify your folders etc!
:: Server
set serverpath="C:\Games\ArmA3\WI_1\"
set serverexe=arma3server.exe

:: Set Paths to files.
set arma3servertools="C:\Arma3Servertools\"
set BERConPath="C:\Games\ArmA3\WI_1\battleye"
set becpath="C:\Arma3Servertools\BEC\"
set ArmaServerMonitorPath="C:\Games\ArmA3\WI_1\"

echo.
echo KILL server
cd /d %serverpath%
taskkill /im %serverexe%
::timeout 2

echo.
echo Kill Bec.exe
cd /d %becpath%
taskkill /im bec.exe
::timeout 2

echo
echo Kill BERCon.exe
cd /d %BERConPath%
taskkill /f /im bercon.exe
::timeout 2

echo
echo Kill ArmaServerMonitor.exe
cd /d %ArmaServerMonitorPath%
taskkill /f /im ArmaServerMonitor.exe


::RESTART

::Check for new Arma3 Update
echo.
echo Checking for new Arma3 Update.
Start "Updater" /wait C:\Arma3Servertools\updater.cmd

xcopy c:\Arma3ServerTools\New_Mission_and_Configs\NewMissionPBO c:\Games\ArmA3\WI_1\mpmissions /s/f/y
xcopy c:\Arma3ServerTools\New_Mission_and_Configs\NewMissions\SERVER c:\Games\ArmA3\WI_1\SERVER\ /s/f/y
xcopy c:\Arma3ServerTools\New_Mission_and_Configs\WI_1 c:\Games\ArmA3\WI_1 /s/f/y
xcopy c:\Arma3ServerTools\New_Mission_and_Configs\BEC c:\Arma3ServerTools\BEC /s/f/y


::BACKUP DATABASE
Start "Backup" /wait C:\Arma3Servertools\MySQLBackups\mysqlbackup.bat

echo.
echo Restarting The Server
:: start the Arma3 Dedicated server
cd /d %serverpath%

:: ONLY USED IF MISSIONS ARE NOT MOVED FROM THE NORMAL MISSIONS FOLDER !
:: -mod= is used if you also have a steam copy installed to that the dedicated server does not load mods from there.
::start "Arma3Server" arma3server.exe -port=2302 -config=CONFIG_Vanilla.cfg -world=empty -maxMem=8192 -enableHT -mod= -cfg=Arma3.cfg -profiles=c:\Games\Arma3\WI_1 -BEpath=c:\Games\ArmA3\WI_1\battleye  -loadMissionToMemory

:: SERVER MISSIONS MOVED SERVER SIDE.
start "Arma3Server" arma3server.exe -port=2302 -config=CONFIG_Vanilla.cfg -world=empty -maxMem=8192 -enableHT -mod=SERVER -cfg=Arma3.cfg -profiles=c:\Games\Arma3\WI_1 -BEpath=c:\Games\ArmA3\WI_1\battleye  -loadMissionToMemory


Start "" C:\Games\Arma3\WI_1\ArmaServerMonitor.exe -w1500 -lfilenameprefix
echo.
echo ASM Started

echo.
echo Starting BERCon.bat
:: start Battleye Rcon
cd /d %BERConPath%
start "BERcon" BERCon.bat


echo.
echo Starting Battleye Extended Controls
cd /d %becpath%
start "Bec" Bec.exe -f Config.cfg --dec

echo.
echo Server Started

::timeout 5
 
cls
@exit