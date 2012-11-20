	private ["_a","_b","_dirTo","_eyeD","_eyePb","_eyePa","_eyeDV"];
	
	//Player
	_a = _this select 0;
	
	//AI to see or not
	_b = _this select 1;
	
	while {true} do 
	{
		_eyeDV = eyeDirection _b;
		_eyeD = ((_eyeDV select 0) atan2 (_eyeDV select 1));
		
		if (_eyeD < 0) then 
		{
			_eyeD = 360 + _eyeD
		};
		
		_dirTo = [_b, _a] call BIS_fnc_dirTo;
		_eyePb = eyePos _b;
		_eyePa = eyePos _a;
		
		if ((abs(_dirTo - _eyeD) >= 90 && (abs(_dirTo - _eyeD) <= 270)) || (lineIntersects [_eyePb, _eyePa]) ||(terrainIntersect [_eyePb, _eyePa])) then 
		{
			hint "NOT IN SIGHT";
		} else {
			hint "IN SIGHT";
		};
	sleep 0.1;
	};