closeDialog 0;
if(!isPlayer(pDialogTeamkiller)) exitWith {};

if(_this) then {
	_uid = getPlayerUID(pDialogTeamkiller);
    diag_log format["WASTELAND SERVER - Team Kill Action Player UID %1", str(_uid)];
	_added = false;
	for "_i" from 0 to (count pvar_teamKillList - 1) do {
		if((pvar_teamKillList select _i select 0) == _uid) then {
			pvar_teamKillList set [_i, [_uid, (pvar_teamKillList select _i select 1) + 1]];
			_added = true;
		};
	};
	if(!_added) then {
		pvar_teamKillList set [count pvar_teamKillList, [_uid, 1]];
        _added = true;
	};

	diag_log format["WASTELAND SERVER - Team Kill Action Player Added %1", str(_added)];
    
	publicVariable "pvar_teamKillList";
}