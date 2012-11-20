_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;
if(isnil {_player getVariable "cmoney"}) then {_player setVariable["cmoney",0,true];};

if(!local _player) exitwith {};

if((_player != _killer) && (vehicle _player != vehicle _killer) && (playerSide == side _killer) && (str(playerSide) in ["WEST", "EAST"])) then {
	pTeamkiller = objNull;
	if(_killer isKindOf "CAManBase") then {
		pTeamkiller = _killer;

		diag_log format ["Teamkilled by %1 (%2)", pTeamkiller, name pTeamkiller];
	} else {
		_veh = (_killer);
		_trts = configFile >> "CfgVehicles" >> typeof _veh >> "turrets";
		_paths = [[-1]];
		if (count _trts > 0) then {
			for "_i" from 0 to (count _trts - 1) do {
				_trt = _trts select _i;
				_trts2 = _trt >> "turrets";
				_paths = _paths + [[_i]];
				for "_j" from 0 to (count _trts2 - 1) do {
					_trt2 = _trts2 select _j;
					_paths = _paths + [[_i, _j]];
				};
			};
		};
		_ignore = ["SmokeLauncher", "FlareLauncher", "CMFlareLauncher", "CarHorn", "BikeHorn", "TruckHorn", "TruckHorn2", "SportCarHorn", "MiniCarHorn", "Laserdesignator_mounted"];
		_suspects = [];
		{
			_weps = (_veh weaponsTurret _x) - _ignore;
			if(count _weps > 0) then {
				_unt = objNull;
				if(_x select 0 == -1) then {_unt = driver _veh;}
				else {_unt = _veh turretUnit _x;};
				if(!isNull _unt) then {
					_suspects = _suspects + [_unt];
				};
			};
		} forEach _paths;

		if(count _suspects == 1) then {
			pTeamkiller = _suspects select 0;

			diag_log format ["Teamkilled by %1 (%2) with %3", pTeamkiller, name pTeamkiller, typeOf vehicle pTeamkiller];
		};
	};
};

if(!isNull(pTeamkiller)) then {
	publicVar_teamkillMessage = pTeamkiller;
	publicVariable "publicVar_teamkillMessage";

	publicVar_reportTeamkiller = [pTeamkiller, player];
	publicVariableServer "publicVar_reportTeamkiller";
};

private["_a","_b","_c","_d","_e","_f","_m","_player","_killer", "_to_delete"];

_to_delete = [];
_to_delete_quick = [];

if((_player getVariable "cmoney") > 0) then {
	_m = "EvMoney" createVehicle (position _player);
	_m setVariable["money", (_player getVariable "cmoney"), true];
	_to_delete = _to_delete + [_m];
};

if((_player getVariable "medkits") > 0) then {
	for "_a" from 1 to (_player getVariable "medkits") do {	
		_m = "CZ_VestPouch_EP1" createVehicle (position _player);
		_to_delete = _to_delete + [_m];
	};
};

if(_player getVariable "bombs") then {
	_pos = getPosATL player;
	_pos set [2, (_pos select 2) + 0.05];

	_bomb = "bomb" createVehicle getPos _player; 
	_vecu = vectorUp _bomb;
	_bomb setPosATL _pos;
	_bomb setVectorUp _vecu;

	_bomb enableSimulation false; 
	_bomb setVariable["bArmed", false, true]; 
};

if((_player getVariable "repairkits") > 0) then {
	for "_b" from 1 to (_player getVariable "repairkits") do {	
		_m = "Suitcase" createVehicle (position _player);
		_to_delete = _to_delete + [_m];
	};
};

//if(_player getVariable "fuelFull") then {
//	_m = "Fuel_can" createVehicle (position _player);
//	_m setVariable["fuel",true,true];
//	_to_delete = _to_delete + [_m];
//};

//if(_player getVariable "fuelEmpty") then {
//	_m = "Fuel_can" createVehicle (position _player);
//	_m setVariable["fuel",false,true];
//	_to_delete = _to_delete + [_m];
//};

if(!surfaceIsWater(getPos _player)) then {
//	if((_player getVariable "water") > 0) then {
//		for "_f" from 1 to (_player getVariable "water") do {	
//			_m = "Land_Teapot_EP1" createVehicle (position _player);
//			_to_delete_quick = _to_delete_quick + [_m];
//		};
//	};
//
//	if((_player getVariable "canfood") > 0) then {
//		for "_c" from 1 to (_player getVariable "canfood") do {	
//			_m = "Land_Bag_EP1" createVehicle (position _player);
//			_to_delete_quick = _to_delete_quick + [_m];
//		};
//	};
//
//	//Drop Rabit meat if unit has it
//	_m = [_player,"rabitmeat",true,"rabit"] call waste_fnc_dropFood;	if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//	_m = [_player,"rabitmeatc",false,"rabit"] call waste_fnc_dropFood;	if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//
//	//Drop Goat meat if unit has it
//	_m = [_player,"goatmeat",true,"goat"] call waste_fnc_dropFood;		if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//	_m = [_player,"goatmeatc",false,"goat"] call waste_fnc_dropFood;	if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//
//	//Drop Cow meat if unit has it
//	_m = [_player,"cowmeat",true,"cow"] call waste_fnc_dropFood;		if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//	_m = [_player,"cowmeatc",false,"cow"] call waste_fnc_dropFood;		if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//
//	//Drop Boar meat if unit has it
//	_m = [_player,"boarmeat",true,"boar"] call waste_fnc_dropFood;		if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//	_m = [_player,"boarmeatc",false,"boar"] call waste_fnc_dropFood;	if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//
//	//Drop Chicken meat if unit has it
//	_m = [_player,"chickenmeat",true,"chicken"] call waste_fnc_dropFood;	if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//	_m = [_player,"chickenmeatc",false,"chicken"] call waste_fnc_dropFood;	if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//
//	//Drop Sheep meat if unit has it
//	_m = [_player,"sheepmeat",true,"sheep"] call waste_fnc_dropFood;	if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
//	_m = [_player,"sheepmeatc",false,"sheep"] call waste_fnc_dropFood;	if(count(_m) > 0) then {_to_delete_quick = _to_delete_quick + _m;};
};

publicVar_objectsToDelete = [_to_delete, _to_delete_quick];
publicVariableServer "publicVar_objectsToDelete";

true spawn {
	waitUntil {playerRespawnTime < 2};
	titleText ["", "BLACK OUT", 1];
};