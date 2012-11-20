/*
	Tire Actions
	
	   by _neo_
*/
private ["_tire", "_unit", "_id"];
_tire = _this select 0;
_unit = _this select 1;
_id = _this select 2;

_tire setVariable ["NEO_tireBeingDragged", nil, true];
