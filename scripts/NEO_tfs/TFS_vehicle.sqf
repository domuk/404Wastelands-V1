/*
	Vehicle Init
	
	  by _neo_
*/
if (!local (_this select 0)) exitWith {};
waitUntil { !isNil "BIS_fnc_init" };
waitUntil { !isNil "NEO_tireFix_initDone" };

private ["_vehicle", "_nrTires", "_maxTires"];
_vehicle = _this select 0;
_nrTires = if (count _this > 1) then { round (_this select 1) } else { [_vehicle] call NEO_tirefix_vehicleCargoTires };
_maxTires = if (count _this > 2) then { round (_this select 2) } else { [_vehicle] call NEO_tirefix_vehicleCargoSpace };
if (_nrTires > _maxTires) then { _maxTires = _nrTires };

if (!isNil { _vehicle getVariable "NEO_vehicleCanBeFixed" }) exitWith {};
_vehicle setVariable ["NEO_vehicleCanBeFixed", true];

//Validate vehicle
if !([_vehicle] call NEO_tirefix_validateVehicle) exitWith { [nil, nil, rHINT, parseText format ["<t color='#FF0000' size='1.5'><br/>Fix Tire Error<br/><br/><br/>Vehicle not supported<br/><br/>%2<br/></t>", typeOf _vehicle]] call RE };

_vehicle setVariable ["NEO_vehicleTiresAvailable", _nrTires, true];
_vehicle setVariable ["NEO_vehicleMaxTiresAvailable", _maxTires, true];
_vehicle setVariable ["NEO_tireFix_tiresBrokenArray", [], true];

//Damaged
[nil, _vehicle, "per", rADDEVENTHANDLER, "HandleDamage",
{
	_this call NEO_tirefix_damaged;
}] call RE;

//Add Action to take out Tire/s
[nil, _vehicle, "per", rADDACTION, "Take out tire", "scripts\NEO_tfs\TFS_act_takeOutTire.sqf", [], -1, false, true, "", 
"
	(alive _target)
	&&
	(!locked _target)
	&&
	((_target getVariable ""NEO_vehicleTiresAvailable"") > 0)
	&&
	((_this distance ([_target] call NEO_tireFix_takeTirePos)) < 1.5)
	&&
	!(animationState _this in [""AcinPknlMwlkSrasWrflDb"", ""acinpknlmstpsraswrfldnon""])
	
"] call RE;

//Add Action to check how many tires there is in the back of the vehicle
[nil, _vehicle, "per", rADDACTION, "Check stored tires", "scripts\NEO_tfs\TFS_act_checkTires.sqf", [], -1, false, true, "", 
"
	(alive _target)
	&&
	(!locked _target)
	&&
	((_this distance ([_target] call NEO_tireFix_takeTirePos)) < 1.5)
	
"] call RE;
