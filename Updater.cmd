@echo off

SETLOCAL ENABLEDELAYEDEXPANSION

       :: DEFINE the following variables where applicable to your install

    SET STEAMLOGIN=WARIRON1 RY6a4pJZgPY9hmVEmr
    SET A3BRANCH=233780 -beta
        :: For stable use SET A3BRANCH=107410
        :: For Dev use SET A3BRANCH=107410 -beta development
        :: For Dedi server stable package use SET A3BRANCH=233780 -beta
                :: Note, the missing qotation marks, these need to be wrapped around the entire "+app_data......"

    SET A3Path=C:\Games\ArmA3\WI_1
        SET STEAMPATH=C:\Apps\Steam


:: _________________________________________________________

echo.
echo     You are about to update ArmA3
echo        Dir: %A3Path%
echo        Branch: %A3BRANCH%
echo.
echo     Key "ENTER" to proceed
::pause
%STEAMPATH%\steamcmd.exe +login %STEAMLOGIN% +force_install_dir %A3Path% +"app_update %A3BRANCH%" validate +quit
echo .
echo     Your ArmA3 is now up to date
echo     key "ENTER" to exit
exit
::pause