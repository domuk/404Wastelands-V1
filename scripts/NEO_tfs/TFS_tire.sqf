/*
	Tire Init
	
	by _neo_
*/
if (!local (_this select 0)) exitWith {};
waitUntil { !isNil "BIS_fnc_init" };
waitUntil { !isNil "NEO_tireFix_initDone" };

private ["_tire"];
_tire = _this select 0;

//Validate
if (typeOf _tire != "Land_Pneu") exitWith { hint "TFS_tire\n\nTire must be of type Land_Pneu" };

[nil, _tire, rENABLESIMULATION, false] call RE;

//Put into a car
[nil, _tire, "per", rADDACTION, "Put Tire Into Car", "scripts\NEO_tfs\TFS_act_putTireIntoCar.sqf", [], -1, false, true, "", 
"
	(_target distance ([(nearestObjects [_target, [""Car"",""Armored""], 5]) select 0] call NEO_tireFix_takeTirePos) < 1.5)
	
"] call RE;

//Drag Tire
[nil, _tire, "per", rADDACTION, "Drag Tire", "scripts\NEO_tfs\TFS_act_drag.sqf", [], -1, false, true, "", 
"
	(animationState _this != ""AcinPknlMwlkSrasWrflDb"")
	&&
	(animationState _this != ""AcinPknlMstpSrasWrflDnon"")
	&&
	((_this distance _target) < 2)
	&&
	(isNil { _target getVariable ""NEO_tireBeingFixed"" })
	&&
	(isNil { _target getVariable ""NEO_tireBeingDragged"" })
	
"] call RE;
