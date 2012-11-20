closeDialog 0;
if(!isPlayer(pDialogTeamkiller)) exitWith {};

if(_this) then {
	_uid = getPlayerUID(pDialogTeamkiller);
	_added = false;
	for "_i" from 0 to (count publicVar_teamkillersList - 1) do {
		if((publicVar_teamkillersList select _i select 0) == _uid) then {
			publicVar_teamkillersList set [_i, [_uid, (publicVar_teamkillersList select _i select 1) + 1]];
			_added = true;
		};
	};
	if(!_added) then {
		publicVar_teamkillersList set [count publicVar_teamkillersList, [_uid, 1]];
	};

	publicVariable "publicVar_teamkillersList";
}