private ["_crates", "_crate"];
_crates = nearestObjects[gsLocation, ["ReammoBox"], 10];
_crates = _crates - [gsLocation];
if((count _crates) < 1) exitWith {hint "No crates found nearby";};

publicVar_sellCrateTry = [
	player,
	_crates select 0
];
publicVariableServer "publicVar_sellCrateTry";