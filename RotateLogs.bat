set arma2srvpath=C:
set srvname=Games\ArmA3\WI_1
set deloriglogs=1
 
IF "%1"=="" (
set servername=%srvname%
) else (
set servername=%1
)
 
title A3Wasteland %servername% Server Log Rotater
 
:: Set Debug Mode
set debug=1
:: Set Debug Timeout in seconds
set dbsecs=10
 
:: Display Debug output
if %debug% == 1 (
echo Server Name = %servername%
echo ArmaII Server Path = "%arma2srvpath%"
timeout %dbsecs%
)
 
:: Set Time and Date
SET HOUR=%time:~0,2%
SET dtStamp9=%date:~-4%%date:~4,2%%date:~7,2%_0%time:~1,1%%time:~3,2%_%time:~6,2%
SET dtStamp24=%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%_%time:~6,2%
::Make Date Stamp
if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)
ECHO Todays Date and time (%date%)(%time%) / %dtStamp%
if %debug% == 1 (
timeout %dbsecs%
)
 
echo (%date%) (%time%) Starting Log Rotation.
 
:: Make the Rotated Log Directories
if exist "C:\Arma3_Wariron#1_Logs" goto maketsdir
mkdir "C:\Arma3_Wariron#1_Logs"
:maketsdir
if exist "C:\Arma3_Wariron#1_Logs\%dtStamp%" goto makebedir
mkdir "C:\Arma3_Wariron#1_Logs\%dtStamp%"
:makebedir
if exist "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye" goto rotatelogs
mkdir "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye"
 
:rotatelogs
:: Starting Log Rotation. If there are any other logs, just follow the format below, and make sure to NOT touch any of the variables.
copy "%arma2srvpath%\%servername%\arma3server.RPT" "C:\Arma3_Wariron#1_Logs\%dtStamp%\arma2oaserver.RPT"
copy "%arma2srvpath%\%servername%\arma2oaserver.mdmp" "C:\Arma3_Wariron#1_Logs\%dtStamp%\arma2oaserver.mdmp"
copy "%arma2srvpath%\%servername%\arma2oaserver.bidmp" "C:\Arma3_Wariron#1_Logs\%dtStamp%\arma2oaserver.bidmp"
copy "%arma2srvpath%\%servername%\server_log.txt" "C:\Arma3_Wariron#1_Logs\%dtStamp%\server_log.txt"

copy "%arma2srvpath%\%servername%\BattlEye\attachto.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\attachto.log"
copy "%arma2srvpath%\%servername%\BattlEye\addbackpackcargo.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\addbackpackcargo.log"
copy "%arma2srvpath%\%servername%\BattlEye\addweaponcargo.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\addweaponcargo.log"
copy "%arma2srvpath%\%servername%\BattlEye\deletevehicle.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\deletevehicle.log"
copy "%arma2srvpath%\%servername%\BattlEye\remotecontrol.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\remotecontrol.log"
copy "%arma2srvpath%\%servername%\BattlEye\selectplayer.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\selectplayer.log"
copy "%arma2srvpath%\%servername%\BattlEye\setvariableval.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\setvariableval.log"
copy "%arma2srvpath%\%servername%\BattlEye\teamswitch.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\teamswitch.log"
copy "%arma2srvpath%\%servername%\BattlEye\waypointcondition.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\waypointcondition.log"
copy "%arma2srvpath%\%servername%\BattlEye\waypointstatements.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\waypointstatements.log"
copy "%arma2srvpath%\%servername%\BattlEye\scripts.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\scripts.log"
copy "%arma2srvpath%\%servername%\BattlEye\createvehicle.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\createvehicle.log"
copy "%arma2srvpath%\%servername%\BattlEye\mpeventhandler.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\mpeventhandler.log"
copy "%arma2srvpath%\%servername%\BattlEye\publicvariable.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\publicvariable.log"
copy "%arma2srvpath%\%servername%\BattlEye\publicvariableval.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\publicvariableval.log"
copy "%arma2srvpath%\%servername%\BattlEye\remoteexec.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\remoteexec.log"
copy "%arma2srvpath%\%servername%\BattlEye\setdamage.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\setdamage.log"
copy "%arma2srvpath%\%servername%\BattlEye\setpos.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\setpos.log"
copy "%arma2srvpath%\%servername%\BattlEye\setvariable.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\setvariable.log"
copy "%arma2srvpath%\%servername%\BattlEye\addmagazinecargo.log" "C:\Arma3_Wariron#1_Logs\%dtStamp%\BattlEye\addmagazinecargo.log"
echo (%date%) (%time%) Logs are backed up now...
echo (%date%) (%time%) Removing original log files.
del /Q /F "%arma2srvpath%\%servername%\arma2oaserver.RPT"
del /Q /F "%arma2srvpath%\%servername%\arma2oaserver.mdmp"
del /Q /F "%arma2srvpath%\%servername%\arma2oaserver.bidmp"
del /Q /F "%arma2srvpath%\%servername%\server_console.log"
::del /Q /F "%arma2srvpath%\%servername%\runtime.log"
::del /Q /F "%arma2srvpath%\%servername%\HiveExt.log"
del /Q /F "%arma2srvpath%\%servername%\server_log.txt"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\attachto.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\addbackpackcargo.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\addweaponcargo.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\deletevehicle.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\remotecontrol.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\selectplayer.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\setvariableval.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\teamswitch.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\waypointcondition.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\waypointstatements.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\scripts.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\createvehicle.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\mpeventhandler.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\publicvariable.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\publicvariableval.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\remoteexec.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\setdamage.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\setpos.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\setvariable.log"
del /Q /F "%arma2srvpath%\%servername%\BattlEye\addmagazinecargo.log"
 
if %debug% == 1 (
timeout %dbsecs%
)
 
:: We are done here.
exit