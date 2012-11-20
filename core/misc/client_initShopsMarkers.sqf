private ["_i"];
for "_i" from 0 to 3 do {deleteMarkerLocal format["safe_zone_%1", _i];};
sleep 5;
_i = 0;
{
	private ["_mname", "_marker"];
	_i = _i + 1;
	_mname = format ["safe_zone_%1", _i];
	_marker = createMarkerLocal [_mname, getPos _x];
	_mname setMarkerShapeLocal "ELLIPSE";
	_mname setMarkerColorLocal "ColorGreen";
	_mname setMarkerSizeLocal [200, 200];
	_mname setMarkerBrushLocal "Grid";
} forEach [gs1, gs2, gs3, gs4];