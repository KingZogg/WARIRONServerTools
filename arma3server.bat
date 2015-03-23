
@echo
::start "serverbat" C:\Games\Arma3\WI_1\arma3server.exe "-profiles=c:\Games\Arma3\WI_1" -name=Administrator -port=2302 -config=CONFIG_Vanilla.cfg -cfg=arma3.cfg -world=empty
start "serverbat" C:\Games\Arma3\WI_1\arma3server.exe
timeout 5
cls
exit