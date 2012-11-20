if (!isServer) exitWith {};
waitUntil { !isNil "BIS_fnc_init" };
waitUntil { !isNil "NEO_tireFix_initDone" };

if (!isNil "NEO_tireFix_allVehiclesArray") exitWith {};
NEO_tireFix_allVehiclesArray = [];

while { true } do
{
	private ["_allVehicles", "_valid"];
	_allVehicles = allMissionObjects "LandVehicle";
	_valid = [];
	
	{
		if
		(
			alive _x
			&&
			([_x] call NEO_tirefix_validateVehicle)
			&&
			!(_x in NEO_tireFix_allVehiclesArray)
		)
		then
		{
			NEO_tireFix_allVehiclesArray set [count NEO_tireFix_allVehiclesArray, _x];
			[nil, _x, "loc", rEXECVM, "scripts\NEO_tfs\TFS_vehicle.sqf", _x] call RE;
		};
	} forEach _allVehicles;
	
	sleep 60;
};
