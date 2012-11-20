/*
        Fix Action
	
	by _neo_
*/
private ["_vehicle", "_unit", "_id", "_selection", "_tire"];
_vehicle = _this select 0;
_unit = _this select 1;
_id = _this select 2;
_selection = (_this select 3) select 0;
_tire = ((nearestObjects [(([_vehicle, _unit, _selection] call NEO_tireFix_relPos) select 0), ["Land_Pneu"], 10]) select 0);

if (!isNil { _tire getVariable "NEO_tireFixDropActionId" }) then
{
	_tire removeAction (_tire getVariable "NEO_tireFixDropActionId");
	_tire setVariable ["NEO_tireFixDropActionId", nil];
};

_vehicle setVariable ["NEO_vehicleBeingFixed", true, true];
_tire setVariable ["NEO_tireBeingFixed", true, true];
if (!isNil { _tire getVariable "NEO_tireBeingDragged" }) then 
{ 
	_tire setVariable ["NEO_tireBeingDragged", nil, true];
	sleep 0.25;
};

_unit setVariable ["NEO_tireFixStopActionId", _unit addAction ["Stop Fixing", "scripts\NEO_tfs\TFS_act_stopFixing.sqf", [], -1, true, true, "", "(_this == _target) && (animationState _this == ""RepairingKneel"")"]];

private ["_locked"];
_locked = locked _vehicle;
if (!_locked) then
{
	[nil, _vehicle, "loc", rSPAWN, _vehicle, { _this lock true }] call RE;
};

_unit setDir (([_vehicle, _unit, _selection] call NEO_tireFix_relPos) select 1);
_unit setPosATL (([_vehicle, _unit, _selection] call NEO_tireFix_relPos) select 0);

private ["_tirePos"];
_tirePos = ([_unit, 1.3, ((getDir _unit) + 90)] call BIS_fnc_relPos);
_tirePos set [2, 0];
_tire setPos _tirePos;

sleep 0.25;
[nil, _unit, rSWITCHMOVE, "RepairingKneel"] call RE;
waitUntil { animationState _unit == "RepairingKneel" };

while { (animationState _unit == "RepairingKneel") && (isNil { _unit getVariable "NEO_stopFix" }) && (alive _unit) && (alive _vehicle) && (lifeState _unit == "ALIVE") } do { sleep 0.01 };
if ((!isNil { _unit getVariable "NEO_stopFix" }) || (!alive _unit) || (!alive _vehicle) || (lifeState _unit != "ALIVE")) exitWith
{
	[nil, _vehicle, "loc", rSPAWN, _vehicle, { _this lock false }] call RE;
	[nil, _unit, rSWITCHMOVE, ""] call RE;
	if (!isNil { _unit getVariable "NEO_stopFix" }) then { _unit setVariable ["NEO_stopFix", nil, true] };
	if (!isNil { _vehicle getVariable "NEO_vehicleBeingFixed" }) then { _vehicle setVariable ["NEO_vehicleBeingFixed", nil, true] };
	if (!isNil { _tire getVariable "NEO_tireBeingFixed" }) then { _tire setVariable ["NEO_tireBeingFixed", nil, true] };
};
	
[nil, _vehicle, "per", rREMOVEACTION, _id] call RE;

if (!isNil { _unit getVariable "NEO_tireFixStopActionId" }) then
{
	_unit removeAction (_unit getVariable "NEO_tireFixStopActionId");
	_unit setVariable ["NEO_tireFixStopActionId", nil];
};

[nil, _vehicle, "loc", rSPAWN, [_vehicle, _selection, _locked], 
{
	(_this select 0) setHit [(_this select 1), 0];
	(_this select 0) setVelocity [0,0,-1];
	if !(_this select 2) then
	{
		(_this select 0) lock false;
	};
}] call RE;

private ["_brokenTires", "_valid"];
_brokenTires = _vehicle getVariable "NEO_tireFix_tiresBrokenArray";
_valid = _brokenTires - [_selection];
_vehicle setVariable ["NEO_tireFix_tiresBrokenArray", _valid, true];
if (!isNil { _vehicle getVariable "NEO_vehicleBeingFixed" }) then { _vehicle setVariable ["NEO_vehicleBeingFixed", nil, true] };
if (!isNil { _tire getVariable "NEO_tireBeingFixed" }) then { _tire setVariable ["NEO_tireBeingFixed", nil, true] };

deleteVehicle _tire;
[nil, _unit, rSWITCHMOVE, ""] call RE;
