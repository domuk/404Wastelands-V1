private ["_index", "_town", "_pos", "_dx", "_dy"];

_player = _this;

_index = floor(random(count aTownsFull));
_town = aTownsFull select _index;
_pos = [(_town select 1),5,65,1,0,0,0] call BIS_fnc_findSafePos;

_dx = ((_town select 1) select 0) - (_pos select 0);
_dy = ((_town select 1) select 1) - (_pos select 1);

_player setPos _pos;
_player setDir (_dx atan2 _dy);
_player setPosATL [(getPos _player) select 0, (getPos _player) select 1, 0.1];

// -----------

_good_vehs_count = 0;
_vehs = (_town select 1) nearobjects ["LandVehicle", _town select 2];
{
	if(canMove _x) then {
		if((_x isKindOf "Bicycle") || ((fuel _x) > 0.05)) then {_good_vehs_count = _good_vehs_count + 1;};
	};
} forEach _vehs;

if(_good_vehs_count < (_town select 4)) then {
	publicVar_newVehiclesDynamic = [
		_index,
		(((_town select 4) - _good_vehs_count) + 2),
		_player
	];

	publicVariableServer "publicVar_newVehiclesDynamic";
};