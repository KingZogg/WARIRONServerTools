// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: moneyMissionProcessor.sqf
//	@file Author: AgentRev

#define GOLD_MISSION_PROC_TYPE_NAME "Gold"
#define GOLD_MISSION_PROC_TIMEOUT (["A3W_GoldMissionTimeout", 120*60] call getPublicVar)
#define GOLD_MISSION_PROC_COLOR_DEFINE goldMissionColor

#include "goldMissions\goldMissionDefines.sqf"
#include "MissionProcessor2.sqf";
