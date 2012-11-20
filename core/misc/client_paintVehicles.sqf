{
	_veh = _x select 0;
	_i = 0;
	{
		_veh setObjectTexture [_i, _x];
		_i = _i + 1;
	} forEach (_x select 1);
} forEach publicVar_paintedVehicles;