// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_TownInvasion.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev, Zenophon
//  @file Information: JoSchaap's Lite version of 'Infantry Occupy House' Original was made by: Zenophon

if (!isServer) exitwith {};

#include "sideMissionDefines.sqf"

private ["_nbUnits", "_box1", "_box2", "_townName", "_missionPos", "_buildingRadius", "_putOnRoof", "_fillEvenly", "_tent1", "_chair1", "_chair2", "_cFire1"];

_setupVars =
{
	_missionType = "Sniper Nest";

	_positions = [[14227,21220,15],[12304,8866,15],[20601,20131,16],[23478,21097,15],[8408,18243,15],[3899,12294,13]];
    //_positions = [[12879.5,16773.3,0],[8951.24,20077.1,0],[3185.9,13146.6,0],[17944.4,12226.1,0],[9520.34,15741.5,0]];

	_missionPos = _positions call BIS_fnc_SelectRandom;	
/*	
Frini				
[[14210.398438,21221.898438,0];

Rebel	
[12299.271484,8875.455078,0];

North of Paros	
[20603.855469,20132.621094,7.62939];

north Delfinaki
[23478.488281,21097.615234,15.8005];

Syrta
[8408.355469,18243.126953,15.3004];

Neri
[3899.702637,12294.24707,12.7005];
*/


	
	_buildingRadius = 35;

	
	// reduce radius for larger towns. for example to avoid endless hide and seek in kavala ;)
	_buildingRadius = if (_buildingRadius > 201) then {(_buildingRadius*0.5)} else {_buildingRadius};
	// 15% chance on AI not going on rooftops
	if (random 1 < 0.75) then { _putOnRoof = true } else { _putOnRoof = false };
	// 5% chance on AI trying to fit into a single building instead of spreading out
	if (random 1 < 0.99) then { _fillEvenly = true } else { _fillEvenly = false };
};

_setupObjects =
{
	_box1 = createVehicle ["Box_East_WpsSpecial_F", _missionPos, [], 5, "None"];
	_box1 setDir random 360;
	
	_box2 = createVehicle ["Box_IND_WpsSpecial_F", _missionPos, [], 5, "None"];
	_box2 setDir random 360;
		
	
	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2];
	
	
	
	// spawn some rebels/enemies :)
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos] call createsniperGroup;

	// move them into buildings
	[_aiGroup, _missionPos, _buildingRadius, _fillEvenly, _putOnRoof] call moveIntoBuildings;

	_missionHintText = format ["A Sniper Nest has been spotted guarding gold and weapons. Head to the marked area and Take them out! Be careful they are fully armed and dangerous!", sideMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2];
};

_successExec =
{
	// Mission completed
	_goldAmmount = 0;
	_goldMinAmmount = 1;
	_goldMaxAmmount = 2;
	_goldAmmount = _goldminAmmount + ceil(random _goldMaxAmmount);
	
	for "_i" from 1 to _goldAmmount do{
		
		_gold = createVehicle ["Land_TinContainer_F", _missionPos, [], 0, "None"];
		//_gold setPosATL (getPosATL _vehicle vectorAdd [(ceil(random (16) - 8)),(ceil(random (16) - 8)),1]);
		};
		
	_goldAmmount = _goldAmmount * 25000;
	
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];

	
	_successHintMessage = format ["The snipers are dead.<br/>There is<br/><t color='%2'> $%1 </t><br/>in gold to collect." ,_goldAmmount, sideMissionColor];
};

_this call sideMissionProcessor;
