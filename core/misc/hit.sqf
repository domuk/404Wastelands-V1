/*
	@file Version: 1D
	@file name: core\misc\hit.sqf
	@file Author: TAW_Tonic
	@file edit: 6/20/2012
	@file description: when called gives the unit the ability to punch or rifle butt another unit and cause damage.
*/

private ["_unit","_target","_pos","_targetPos","_angle","_target_damag"];
_unit = player;
_target = nearestObjects[getPos player, ["Man","Man"], 1.7] select 1;
_pos = getPos _unit;
_targetPos = getPos _target;

if(hitStateVar) exitWith {};
if(isNil {_target}) exitwith {};
if(!alive _target) exitwith {};
if((playerSide in [west, east]) && (side _target == playerSide)) exitwith {};
if(animationState _target == "adthpercmstpslowwrfldnon_4") exitwith {};
if(animationState player == "AmelPercMstpSnonWnonDnon_zasah6hlava") exitWith {};
if(animationState player == "adthpercmstpslowwrfldnon_4") exitWith {};
if(!alive player) exitWith {};
if(_target isKindOf "CIV_Contractor1_BAF") exitwith {};
if((animationState player == "AmelPercMstpSnonWnonDnon_amaterUder3") OR (animationState player == "AmelPercMstpSlowWrflDnon_StrokeGun")) exitWith {};
_angle=(((_targetPos select 0) - (_pos select 0)) atan2 ((_targetPos select 1)-(_pos select 1)));

_unit setdir _angle;
hitStateVar = true;
if(primaryWeapon _unit == "" && secondaryWeapon _unit == "") then
{
	if(player distance _target > 1.7) exitwith {sleep 2; hitStateVar = false;};
	_unit playmove "AmelPercMstpSnonWnonDnon_amaterUder3";
	_animStart = time;
	_target_damag = damage _target;
	_target_damag = _target_damag + 0.26;
	sleep 1.3;
	_target setdamage _target_damag;
	if((damage _target) > 0.5) then {
	[nil,_target,rSwitchmove, "adthpercmstpslowwrfldnon_4"] call RE;
	[nil,_target,rExecVM, "core\misc\knockout.sqf",_target] call RE;
	sleep 30;
	[nil,_target,rSwitchMove, "amovppnemstpsnonwnondnon"] call RE;
	}
		else
	{
	[nil,_target,rswitchmove,"AmelPercMstpSnonWnonDnon_zasah6hlava"] call RE;
	};
	_target switchmove "adthpercmstpslowwrfldnon_4";
	
}
	else
{
if(player distance _target > 1.7) exitwith {sleep 2; hitStateVar = false;};
	_unit playmove "AmelPercMstpSlowWrflDnon_StrokeGun";
	
	_target_damag = damage _target;
	_target_damag = _target_damag + 0.6;
	sleep 1.5;
	_target setdamage _target_damag;
	if((damage _target) > 0.4) then {
	[nil,_target,rSwitchmove, "adthpercmstpslowwrfldnon_4"] call RE;
	[nil,_target,rExecVM, "core\misc\knockout.sqf",_target] call RE;
	sleep 30;
	[nil,_target,rSwitchMove, "amovppnemstpsnonwnondnon"] call RE;
	}
		else
	{
	[nil,_target,rswitchmove,"AmelPercMstpSnonWnonDnon_zasah6hlava"] call RE;
	};
};
sleep 3;
hitStateVar = false;