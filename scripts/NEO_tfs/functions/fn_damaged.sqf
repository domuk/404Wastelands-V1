if (!local (_this select 0)) exitWith {};
if (!alive (_this select 0)) exitWith {};

private ["_vehicle", "_selection", "_damage"];
_vehicle = _this select 0;
_selection = _this select 1;
_damage = _this select 2;

if 
(
	(
		(_selection == "wheel_1_1_steering")
		||
		(_selection == "wheel_1_2_steering")
		||
		(_selection == "wheel_2_1_steering")
		||
		(_selection == "wheel_2_2_steering")
		||
		(_selection == "wheel_2_3_steering")
		||
		(_selection == "wheel_1_3_steering")
		||
		(_selection == "wheel_2_4_steering")
		||
		(_selection == "wheel_1_4_steering")
	) 
	&&
	!(_selection in (_vehicle getVariable "NEO_tireFix_tiresBrokenArray")) 
	&& 
	(_damage >= 0.79)
) 
then
{
	private ["_brokenArray"];
	_brokenArray = (_vehicle getVariable "NEO_tireFix_tiresBrokenArray");
	_brokenArray set [(count _brokenArray), _selection];
	_vehicle setVariable ["NEO_tireFix_tiresBrokenArray", _brokenArray, true];
	
	//Action to fix
	[nil, _vehicle, "per", rADDACTION, "Fix broken tire", "scripts\NEO_tfs\TFS_act_startFixing.sqf", [_selection], -1, false, true, "", format [
	"
		(alive _target)
		&&
		(count crew _target < 1)
		&&
		((_this distance (([_target, _this, ""%1""] call NEO_tireFix_relPos) select 0)) < 1.5)
		&&
		(count (nearestObjects [(([_target, _this, ""%1""] call NEO_tireFix_relPos) select 0), [""Land_Pneu""], 1.5]) > 0)
		&&
		(""%1"" in (_target getVariable ""NEO_tireFix_tiresBrokenArray""))
		&&
		(isNil { _target getVariable ""NEO_vehicleBeingFixed"" })
		
	", _selection]] call RE;
};

_damage;
