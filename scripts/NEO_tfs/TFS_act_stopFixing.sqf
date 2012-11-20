/*
       Stop Fixing
	
	by _neo_
*/
if (!local (_this select 1)) exitWith {};
waituntil { !isNil "BIS_fnc_init" };

private ["_vehicle", "_player", "_id"];
_vehicle = _this select 0;
_player = _this select 1;
_id = _this select 2;

_player removeAction _id;

if (!isNil { _player getVariable "NEO_tireFixStopActionId" }) then 
{ 
	_player setVariable ["NEO_tireFixStopActionId", nil];
};

_player setVariable ["NEO_stopFix", true, true];
