/*
	@file Version: 1D
	@file name: core\ai_roam.sqf
	@file Author: TAW_Tonic
	@file edit: 9/13/2012
	@file description: initiates random AI to come attack the target
*/
sleep 30; //Let's put it to sleep for an extra 30 seconds
private["_target","_aiArray","_group","_temp","_spawnPos","_targets","_randTime","_startTime"];
waitUntil {!isNil {SHK_pos}};

_totalAI = {!isPlayer _x && side _x == resistance;} count allUnits; //fetch AI Count
if(_totalAI < 60) then
{
_randTime = [2000,700] call fnc_hTime;
_target = vehicle player; //Our target

//Our array of spawnable AI
_aiArray = ["GUE_Soldier_CO","GUE_Soldier_GL","GUE_Soldier_AT","GUE_Soldier_AR","GUE_Soldier_2","GUE_Soldier_1"];

_group = createGroup resistance;
_spawnPos = [getPos _target,random 360,[400,700],false,2] call SHK_pos;

while {(typeName _spawnPos) != "ARRAY"} do
{
	_spawnPos = [getPos _target,random 360,[400,700],false,2] call SHK_pos;
};
//Let's create our squad
{
	_temp = _group createunit [_x,_spawnPos, [], 0, "Form"];
	_temp setUnitRecoilCoefficient 1.5;
	[_temp] execVM "core\ai_fnc.sqf";
} foreach _aiArray;

while {(count units _group) >=1} do
{
	if(!alive _target) then
	{
	//Search for new target, if no actual player within 400m lets destroy this group
		_target = ObjNull;
		_targets = leader(_group) nearEntities ["Man", 500];
		{
			if((isPlayer _x) AND (alive _x)) then
			{
			if(isNull _target) then {_target = _x;};
			};
		} foreach _targets;

		if(isNull _target) then
		{
			{deleteVehicle _x;} foreach units _group;
		};	
	};
	if(leader(_group) distance _target > 450) then
	{
		_group setSpeedMode "NORMAL";
	} else
	{
		_group setSpeedMode "LIMITED";
	};

	if((leader(_group) knowsAbout _target) > 2.5) then
	{
		if(leader(_group) distance _target > 250) then
		{
			if(leader(_group) distance _target < 120) then { leader(_group) reveal _target;};
			_group move getPos _target;
		}
		else
		{
			{
				commandStop _x;
			} foreach units _group;
		};
	}
	else
	{
		if(leader(_group) distance _target < 120) then { leader(_group) reveal _target;};
		_group move getPos _target;
	};

	sleep 20;
};
};
_startTime = time;
waitUntil {(time - _startTime) > _randTime};

[] execVM "core\ai_roam.sqf"; //Start it up again