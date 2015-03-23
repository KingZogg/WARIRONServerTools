@echo off
:: Modify your folders etc!
:: Server
set serverpath="C:\Games\ArmA3\WI_2\"
set serverexe=arma3server.exe

:: Set Paths to files.
set arma3servertools="C:\Arma3Servertools\"
set BERConPath="C:\Games\ArmA3\WI_2\battleye"
set becpath="C:\Arma3Servertools\BEC\"
set ArmaServerMonitorPath="C:\Games\ArmA3\WI_2\"


::RESTART


echo.
echo Restarting The Server
:: start the Arma3 Dedicated server
cd /d %serverpath%


:: SERVER MISSIONS MOVED SERVER SIDE.
start "WARIRON 2" arma3server.exe -port=2322 -config=CONFIG_Vanilla.cfg -world=empty -maxMem=8192 -enableHT -mod=SERVER -cfg=Arma3.cfg -profiles=c:\Games\Arma3\WI_2 -BEpath=c:\Games\ArmA3\WI_2\battleye  -loadMissionToMemory


echo.
echo Server Started

::timeout 5
 
cls
@exit