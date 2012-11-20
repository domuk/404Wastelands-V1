_player = _this;

_player removeWeapon "ItemGPS";
removeAllWeapons _player;
removeBackpack _player;

// ---------------------------------
if(client_isDebug) then {
	_spawn = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_spawn set [0, (_spawn select 0) + 0];
	_spawn set [1, (_spawn select 1) + 120];
	_spawn set [2, 0];
	_player setpos _spawn;
	_player addWeapon "ItemGPS";
	_player allowDamage false;
	setPlayerRespawnTime 10;

	closeDialog 0;
	client_inRespawn = false;
	client_respawnDialogActive = false;
	titleText ["", "BLACK IN", 0.00001];
};
// ---------------------------------

_player addMagazine "17Rnd_9x19_glock17";
_player addWeapon "glock17_EP1";
_player selectWeapon "glock17_EP1";
_player addrating 2000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

terminate playerMenuHandle;
playerMenuHandle = [] spawn {
	waituntil {!isnull player};
	private ["_veh"];
	while {true} do {
		waituntil {vehicle player == player};
		if (!isnil "_veh") then {_veh removeaction playerMenuId};
		playerMenuId = player addAction [format ["<t color='#BE6300'>%1</t>", localize "STR_WL_Acts_PlayerMenu"], "player_system\init.sqf",[],-10,false,false,"","local player"];
		waituntil {vehicle player != player};
		player removeaction playerMenuId;
		_veh = vehicle player;
		playerMenuId = _veh addAction [format ["<t color='#BE6300'>%1</t>", localize "STR_WL_Acts_PlayerMenu"], "player_system\init.sqf",[],-10,false,false,"","local player"];
	};
};

thirstLevel = 120;
hungerLevel = 120;

_player setVariable["cmoney",200,false];
_player setVariable["rabitmeat",0,false];
_player setVariable["goatmeat",0,false];
_player setVariable["cowmeat",0,false];
_player setVariable["boarmeat",0,false];
_player setVariable["chickenmeat",0,false];
_player setVariable["sheepmeat",0,false];
_player setVariable["rabitmeatc",0,false];
_player setVariable["goatmeatc",0,false];
_player setVariable["cowmeatc",0,false];
_player setVariable["boarmeatc",0,false];
_player setVariable["chickenmeatc",0,false];
_player setVariable["sheepmeatc",0,false];
_player setVariable["canfood",2,false];
_player setVariable["medkits",0,false];
_player setVariable["water",2,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", true, false];
_player setVariable["fuelEmpty", false, false];
_player setVariable["bombs",false,false];

[] execVM "core\playerActions.sqf";

publicVar_registerPlayer = [player, getPlayerUID player];
publicVariableServer "publicVar_registerPlayer";
