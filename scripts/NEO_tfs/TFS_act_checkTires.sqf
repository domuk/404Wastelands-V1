/*
     Check how many 
   tires are in cargo
	
	by _neo_
*/
private ["_vehicle", "_unit", "_id"];
_vehicle = _this select 0;
_unit = _this select 1;
_id = _this select 2;

private ["_x", "_y", "_available", "_capacity"];
_x = 0;
_y = 0.7;
_available = (_vehicle getVariable "NEO_vehicleTiresAvailable");
_capacity = (_vehicle getVariable "NEO_vehicleMaxTiresAvailable");

[format ["<t size='1.4'>%1</t><img size='1.5' image='scripts\NEO_tfs\img\TFS_tirePic.paa'/><t size='1.4'>%2</t>", _available, _capacity], _x, _y, 2, 0] call BIS_fnc_dynamicText;
