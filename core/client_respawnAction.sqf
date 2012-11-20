_button = _this;

_is_teamplayer = str(playerSide) in ["WEST", "EAST"];

_towns_enemies = [];
{
	_twn = _x;
	_cnt = 0;
	{
		if((_twn select 1) distance _x < (_twn select 2)) then {
			if(_is_teamplayer) then {
				if(side _x != playerSide) then {
					_cnt = _cnt + 1;
				};
			} else {
				_cnt = _cnt + 1;
			};
		};
	} forEach playableUnits;
	_towns_enemies set [count _towns_enemies, _cnt];
} forEach aTownsFull;

_town_index = -1;

if(_button in [0,1,2,3,4]) then {
	if(_is_teamplayer) then {
		_town_selected = client_respawnDialog_TownsButtons select _button;
		if(_town_selected >= 0 && _town_selected < (count aTownsFull)) then {
			_town_index = _town_selected;
		};
	} else {
		_indexes = [];
		for "_i" from 0 to (count aTownsFull - 1) do {
			if(_towns_enemies select _i < 1) then {
				if((aTownsFull select _i select 6) == _button) then {
					_indexes set [count _indexes, _i];
				};
			};
		};
		if(count _indexes > 0) then {
			_town_index = _indexes select floor(random(count _indexes));
		};
	};
};

if(_town_index == -1) then {
	_good_indexes = [];
	for "_i" from 0 to (count aTownsFull - 1) do {
		if(_towns_enemies select _i < 1) then {
			_good_indexes set [count _good_indexes, _i];
		};
	};
	if(count _good_indexes > 0) then {
		_town_index = _good_indexes select floor(random(count _good_indexes));
	} else {
		_town_index = floor(random(count aTownsFull));
	};
};

//_town_index = 21;

// Respawn
_town = aTownsFull select _town_index;
_pos = [(_town select 1),5,65,1,0,0,0] call BIS_fnc_findSafePos;

_dx = ((_town select 1) select 0) - (_pos select 0);
_dy = ((_town select 1) select 1) - (_pos select 1);

player setPos _pos;
player setDir (_dx atan2 _dy);
player setPosATL [(getPos player) select 0, (getPos player) select 1, 0.1];

// -----------

_good_vehs_count = 0;
_empty_vehs = [];
_vehs = (_town select 1) nearobjects ["LandVehicle", _town select 2];
{
	if(canMove _x) then {
		if((_x isKindOf "Bicycle") || ((fuel _x) > 0.05)) then {_good_vehs_count = _good_vehs_count + 1;};

		if((count crew _x) == 0 && !(_x isKindOf "Motorcycle")) then {
			_weps = (getWeaponCargo _x) select 0;
			_fwep = if(count(_weps)==1) then {_weps select 0} else {false};
			if(count(_weps) == 0 || (count(_weps) == 1 && (_fwep in ["ItemRadio","ItemCompass","ItemWatch","ItemMap","glock17_EP1"]))) then {
				_empty_vehs set [count _empty_vehs, _x];
			};
		};
	};
} forEach _vehs;

if((_good_vehs_count < (_town select 4)) || ((count _empty_vehs) > 0)) then {
	_req_count = 0;
	if(_good_vehs_count < (_town select 4)) then {_req_count = (((_town select 4) - _good_vehs_count) + 2);};

	if(_req_count > 2) then {
		_empty_vehs = [];
	};

	publicVar_newVehiclesDynamic = [
		_town_index,
		_req_count,
		_empty_vehs,
		player
	];

	publicVariableServer "publicVar_newVehiclesDynamic";
};

//hint format ["%1, %2", publicVar_newVehiclesDynamic, _vehs];

_mins = floor(60 * (daytime - floor(daytime)));
[
	getText(configFile >> "CfgWorlds" >> worldName >> "Names" >> (_town select 5) >> "name"),
	format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;

client_respawnDialogActive = false;
client_inRespawn = false;
closeDialog 0;

if(isNil{client_firstSpawn}) then {
	client_firstSpawn = true;
	[] execVM "core\client_introMessage.sqf";
    
    true spawn {
        
        _startTime = LocalTime;
        diag_log format["WASTELAND SERVER - LocalTime = %1", LocalTime];
        waitUntil{
        	_currTime = LocalTime;
    		_result = [_currTime, _startTime, 3] call client_CompareTime;
    		(_result == 1)    
        };
		if(playerSide in [west, east]) then {
			_found = false;
			{
				if(_x select 0 == playerUID) then {_found = true;};
			} forEach pvar_teamSwitchList;
			if(!_found) then {
				pvar_teamSwitchList set [count pvar_teamSwitchList, [playerUID, playerSide]];
				publicVariable "pvar_teamSwitchList";
                
                _side = "";
                if(str(playerSide) == "WEST") then {
                    _side = "Blufor";
                };
                
                if(str(playerSide) == "EAST") then {
                    _side = "Opfor";
                };
                
				titleText [format["You have been locked to %1",_side],"PLAIN",0];
			};
		};
	};
};