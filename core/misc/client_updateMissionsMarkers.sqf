{deleteMarkerLocal _x;} forEach client_missionsMarkers;
client_missionsMarkers = [];

{
	private ["_marker"];
	_marker = createMarkerLocal [_x select 0, _x select 2];
	_marker setMarkerTypeLocal (_x select 3 select 0);
	_marker setMarkerColorLocal (_x select 3 select 1);
	_marker setMarkerTextLocal (_x select 1);

	client_missionsMarkers = client_missionsMarkers + [_x select 0];
} forEach publicVar_missionsMarkers;
