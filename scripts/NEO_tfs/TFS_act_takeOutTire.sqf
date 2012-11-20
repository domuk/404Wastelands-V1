/*
     Take Tire from cargo
	
	by _neo_
*/
private ["_vehicle", "_player", "_id"];
_vehicle = _this select 0;
_player = _this select 1;
_id = _this select 2;

_vehicle setVariable ["NEO_vehicleTiresAvailable", ((_vehicle getVariable "NEO_vehicleTiresAvailable") - 1), true];

private ["_pos"];
_pos = ([_player, 1, (getDir _player)] call BIS_fnc_relPos);
_pos set [2, 0];

_tire = createVehicle ["Land_Pneu", _pos, [], 0, "CAN_COLLIDE"];

private ["_s"];
_s = [_tire] execVM "scripts\NEO_tfs\TFS_tire.sqf";
waitUntil { scriptDone _s };
[_tire, _player, 0, []] execVM "scripts\NEO_tfs\TFS_act_drag.sqf";
