#define respawn_dialog 3400
#define respawn_title 3401
#define respawn_text 3402
#define respawn_button_random 3403
#define respawn_button_random_title 3404
#define respawn_button_city 3410
#define respawn_button_city_title 3420

/* Code by Sa-Matra */
/* I'll kill you in your sleep if you'll use this code without asking */

disableSerialization;

createDialog "RespawnSelectionDialog";
_display = uiNamespace getVariable "RespawnSelectionDialog";
(_display displayCtrl respawn_title) ctrlSettext (localize "STR_WL_Dlg_RespawnTitle");
(_display displayCtrl respawn_button_random) ctrlSettext (localize "STR_WL_Dlg_RespawnRandomButton");
(_display displayCtrl respawn_button_random_title) ctrlSettext (localize "STR_WL_Dlg_RespawnRandomTitle");

_display displayAddEventHandler ["KeyDown", "_return = false; if(client_respawnDialogActive && (_this select 1) == 1) then {_return = true;}; _return"];

client_respawnDialogActive = true;

if(!(str(playerSide) in ["WEST", "EAST"])) then {
	(_display displayCtrl respawn_text) ctrlSettext (localize "STR_WL_Dlg_RespawnTextFFA");

	for "_i" from 0 to 4 do {
		(_display displayCtrl (respawn_button_city + _i)) ctrlShow false;
		(_display displayCtrl (respawn_button_city + _i)) ctrlCommit 0;
	};
} else {
	(_display displayCtrl respawn_text) ctrlSettext (localize "STR_WL_Dlg_RespawnText");

	for "_i" from 0 to 4 do {
		(_display displayCtrl (respawn_button_city + _i)) ctrlShow false;
		(_display displayCtrl (respawn_button_city + _i)) ctrlCommit 0;
	};

	private ["_index"];

	_active_towns = [-1, -1, -1, -1, -1];
	_active_towns_buttons = [-1, -1, -1, -1, -1];
	_active_towns_players = [[], [], [], [], []];

	while {client_respawnDialogActive} do {
		_good_towns = [];
		_good_towns_players = [];
		for "_i" from 0 to (count aTownsFull - 1) do {
			_cnt_f = 0;
			_cnt_e = 0;
			_plrs = [];
			_twn = aTownsFull select _i;
			_towns set [_i, 0];
			{
				if((_twn select 1) distance _x < (_twn select 2)) then {
					if(side _x == playerSide) then {
						_cnt_f = _cnt_f + 1;
						_plrs = _plrs + [_x];
					} else {
						_cnt_e = _cnt_e + 1;
					};
				};
			} forEach playableUnits;
			if(_cnt_f >= 1 && _cnt_e <= 0) then {
				_good_towns set [count _good_towns, _i];
				_good_towns_players set [count _good_towns_players, _plrs];
			};
		};

		for "_i" from 0 to 4 do {
			if((_active_towns select _i) != -1) then {
				if(!((_active_towns select _i) in _good_towns)) then {
					_active_towns set [_i, -1];
				} else {
					for "_j" from 0 to (count _good_towns - 1) do {
						if(_active_towns select _i == _good_towns select _j) then {
							_active_towns_players set [_i, _good_towns_players select _j];
							_j = 100;
						};
					};
				};
			};
		};

		for "_i" from 0 to (count _good_towns - 1) do {
			if(!((_good_towns select _i) in _active_towns)) then {
				for "_j" from 0 to 4 do {
					if(_active_towns select _j == -1) then {
						_active_towns set [_j, _good_towns select _i];
						_active_towns_buttons set [_j, _good_towns select _i];
						_active_towns_players set [_j, _good_towns_players select _i];
						_j = 5;
					};
				};
			};
		};

		client_respawnDialog_TownsButtons = _active_towns_buttons;

		for "_i" from 0 to 4 do {
			if(_active_towns select _i != -1) then {
				(_display displayCtrl (respawn_button_city + _i)) ctrlShow true;
				(_display displayCtrl (respawn_button_city + _i)) ctrlSetText getText(configFile >> "CfgWorlds" >> worldName >> "Names" >> (aTownsFull select (_active_towns select _i) select 5) >> "name");
				_str = name (_active_towns_players select _i select 0);
				for "_j" from 1 to (count (_active_towns_players select _i) - 1) do {
					_str = format ["%1, %2", _str, name (_active_towns_players select _i select _j)];
				};
				(_display displayCtrl (respawn_button_city_title + _i)) ctrlSetText format [localize "STR_WL_Dlg_RespawnPlayers", _str];
			} else {
				(_display displayCtrl (respawn_button_city + _i)) ctrlShow false;
				(_display displayCtrl (respawn_button_city_title + _i)) ctrlSetText "";
			};
			(_display displayCtrl (respawn_button_city + _i)) ctrlCommit 0;
		};

		sleep 2;
	};
};