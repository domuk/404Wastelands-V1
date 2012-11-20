/*
	@file Version: 1D
	@file name: core\ai_fnc.sqf
	@file Author: TAW_Tonic
	@file edit: 9/13/2012
	@file description: Custom AI functionality to tell the unit to target the given player within range regardless of their faction.
*/
private["_unit","_targets","_potentialTarget","_bool","_dirTo","_eyeD","_eyePb","_eyePa","_eyeDV"];
_unit = _this select 0;

//This makes the unit always stand up. This is due to line of sight when looking for players.
_unit setUnitPos "up";

while {alive _unit} do
{
	_targets = _unit nearEntities ["Man", 350];
	_lastCheck = time;
	if(!isNil {_targets}) then
	{
		{
			_potentialTarget = _x;
			if(isPlayer _potentialTarget) then
			{
				_eyeDV = eyeDirection _potentialTarget;
				_eyeD = ((_eyeDV select 0) atan2 (_eyeDV select 1));
				
				if (_eyeD < 0) then 
				{
					_eyeD = 360 + _eyeD
				};
				
				_dirTo = [_unit, _potentialTarget] call BIS_fnc_dirTo;
				_eyePb = eyePos _unit;
				_eyePa = eyePos _potentialTarget;
				
				//_bool = lineIntersects [eyePos _unit, eyePos _potentialTarget,_unit,_potentialTarget];
				if ((!side _potentialTarget == civilian) && (abs(_dirTo - _eyeD) >= 90 && (abs(_dirTo - _eyeD) <= 270)) || (lineIntersects [_eyePb, _eyePa]) ||(terrainIntersect [_eyePb, _eyePa])) then
				{
					_unit doTarget _potientialTarget;
					_unit commandFire _potentialTarget;
					_unit doFire _potentialTarget;
					_unit suppressFor 1;
				
					while {alive _potentialTarget AND alive _unit} do
					{
						_unit doFire _potentialTarget;
					};
				};
			};
		} foreach _targets;
	};
	sleep 30;
};

