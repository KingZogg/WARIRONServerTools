// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: goldMissionController.sqf
//	@file Author: AgentRev, KingZog [git]

#define MISSION_CTRL_PVAR_LIST GoldMissions
#define MISSION_CTRL_TYPE_NAME "Gold"
#define MISSION_CTRL_FOLDER "goldMissions"
#define MISSION_CTRL_DELAY (["A3W_goldMissionDelay", 15*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE goldMissionColor

#include "goldMissions\goldMissionDefines.sqf";
#include "missionController.sqf";
