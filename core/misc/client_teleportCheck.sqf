private ["_docheck", "_pos", "_time"];

_docheck = true;
_pos = nil;
_time = nil;
while {true || _docheck} do {
	if(alive player && !client_inRespawn) then {
		if(!isNil{_pos}) then {
			//hint format ["%1", (_pos distance (getPos player))];
			if((_pos distance (getPos player)) > 300) then {
				publicVar_reportTeleport = [player, _pos, getPos player, serverTime - _time];
				publicVariableServer "publicVar_reportTeleport";
			};
		};
		_pos = getPos player;
		_time = serverTime;
	} else {
		_pos = nil;
	};
	sleep 1;
};