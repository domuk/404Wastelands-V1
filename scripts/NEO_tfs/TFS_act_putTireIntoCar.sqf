/*
	Tire Actions
	
	   by _neo_
*/
private ["_tire", "_unit", "_id"];
_tire = _this select 0;
_unit = _this select 1;
_id = _this select 2;

private ["_newVehicle", "_tiresAvailable", "_cargoSpace", "_newTiresNr"];
_newVehicle = ((nearestObjects [_tire, ["Car","Armored"], 5]) select 0);
_tiresAvailable = _newVehicle getVariable "NEO_vehicleTiresAvailable";
_cargoSpace = _newVehicle getVariable "NEO_vehicleMaxTiresAvailable";
_newTiresNr = 0;

if (_tiresAvailable < _cargoSpace) then
{
	detach _tire;
	deleteVehicle _tire;
	[nil, _unit, rSWITCHMOVE, ""] call RE;
	_newTiresNr = _tiresAvailable + 1;
	_newVehicle setVariable ["NEO_vehicleTiresAvailable", _newTiresNr, true];
}
else
{
	["<t size='1'>No more space</t>", 0, 0, 2, 0.5] call BIS_fnc_dynamicText;
};
