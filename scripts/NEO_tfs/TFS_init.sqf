/*
       TFS_init.sqf

- Pre-Process Functions
	
	by _neo_
*/
if (!isNil "NEO_tireFix_initDone") exitWith {};
waitUntil { !isNil "BIS_fnc_init" };

if (isNil "NEO_tireFix_relPos") then {	NEO_tireFix_relPos = compile preprocessFileLineNumbers "scripts\NEO_tfs\functions\fn_relPos.sqf" };
if (isNil "NEO_tirefix_validateVehicle") then {	NEO_tirefix_validateVehicle = compile preprocessFileLineNumbers "scripts\NEO_tfs\functions\fn_validateVehicle.sqf" };
if (isNil "NEO_tirefix_vehicleCargoTires") then { NEO_tirefix_vehicleCargoTires = compile preprocessFileLineNumbers "scripts\NEO_tfs\functions\fn_vehicleCargoTires.sqf" };
if (isNil "NEO_tirefix_vehicleCargoSpace") then { NEO_tirefix_vehicleCargoSpace = compile preprocessFileLineNumbers "scripts\NEO_tfs\functions\fn_vehicleCargoSpace.sqf" };
if (isNil "NEO_tirefix_takeTirePos") then { NEO_tirefix_takeTirePos = compile preprocessFileLineNumbers "scripts\NEO_tfs\functions\fn_takeTirePos.sqf" };
if (isNil "NEO_tirefix_damaged") then { NEO_tirefix_damaged = compile preprocessFileLineNumbers "scripts\NEO_tfs\functions\fn_damaged.sqf" };

if (!isDedicated) then
{
	waitUntil { !isNil { player } };
	waitUntil { !isNull player };
	waitUntil { !(player != player) };
	
	player createDiarySubject ["About", "About"];
	player createDiaryRecord  ["About", ["Tire Fix", 
	"
		<br/>
		Developer: _neo_
		<br/>
		Version: 1.01
		<br/>
		Credits: Igmmig, Osmo, Mr Ben, Andy and all other Tour members for the great ideas, suggestions, feedback and testing
		<br/>
		<br/>
		<br/>
		- You are able to fix the vehicle tires if broken and spare tires are available
		<br/>
		- Tires can be dragged and put back inside vehicles
		<br/>
		- To fix a broken wheel, drag a new tire to the position and an action will appear to start fixing
		<br/>
		- While fixing the tire, you can abort at any point by using action menu
		<br/>
		- Tires can be shared through vehicles, for example you can store new tires inside vehicles that had none (Depending on vehicle's capacity)
		<br/>
		<br/>
	"]];
};

NEO_tireFix_initDone = true;
