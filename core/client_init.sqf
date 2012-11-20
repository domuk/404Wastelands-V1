diag_log "================ Wasteland client ==================";

removeAllWeapons player;
removeBackpack player;
player removeWeapon "ItemGPS";

//waitUntil {!isNil {BIS_fnc_init}};
waitUntil{player == player};
waitUntil{time > 0};

publicVar_newVehiclesDynamic = [];
publicVar_clientInit = [player];
publicVariableServer "publicVar_clientInit";

client_isDebug = false;
client_quietMode = false;
client_respawnDialogActive = false;

client_actionInterrupt = false;

player call client_spawnStuff;

if(!isNil "client_initEH") then {player removeEventHandler ["Respawn", client_initEH];};
player addEventHandler ["Respawn", {[_this] call onRespawn;}];
player addEventHandler ["Killed", {[_this] call onKilled;}];
player addEventHandler ["Hit", {[_this] call onHit}];
player addEventHandler ["fired", {[_this] call onFired}];

if(!(playerSide in [west, east, resistance])) then {
	endMission "LOSER";
};

"publicVar_takeMoneySuccess" addPublicVariableEventHandler {
	_obj = publicVar_takeMoneySuccess;
	_mon = _obj getVariable "money";
	if(typeName(_mon) == typeName(1)) then {
		player setVariable["cmoney", (player getVariable "cmoney") + _mon, true];
		player playmove "AinvPknlMstpSlayWrflDnon";
		hint format["You have picked up $%1", _mon];
	};
	deleteVehicle (_obj);
};

"publicVar_sellCrateSuccess" addPublicVariableEventHandler {
	_obj = publicVar_sellCrateSuccess;
	_obj execVM "player_system\sellCrate.sqf";
};

pTeamkiller = objNull;
iMyUID = getPlayerUID(player);
"publicVar_teamkillersList" addPublicVariableEventHandler {
	if(str(playerSide) in ["WEST", "EAST"]) then {
		{
			if(_x select 0 == iMyUID) then {
				if((_x select 1) >= 2) then {
					endMission "LOSER";
				};
			};
		} forEach publicVar_teamkillersList;
	};
};
_dokick = false;
if(str(playerSide) in ["WEST", "EAST"]) then {
	{
		if(_x select 0 == iMyUID) then {
			if((_x select 1) >= 2) then {
				_dokick = true;
			};
		};
	} forEach publicVar_teamkillersList;
};
if(_dokick) exitWith {
	titleText [localize "STR_WL_Loading_Teamkiller", "black"]; titleFadeOut 9999;
	[] spawn {
		sleep 20;
		endMission "LOSER";
	};
};

client_missionsMarkers = [];
"publicVar_missionsMarkers" addPublicVariableEventHandler {[] call client_updateMissionsMarkers};

"publicVar_paintedVehicles" addPublicVariableEventHandler {[] call client_paintVehicles};
[] call client_paintVehicles;

"publicVar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn client_teamkillMessage;};};

"publicVar_doTest" addPublicVariableEventHandler {[] execVM "_wtf.sqf";};

[] execVM "core\init_survival.sqf";
	
keysDown = compile preprocessFile "core\misc\keyHandler.sqf";
[] spawn {
	private ["_display"];
	_display = null;
	disableSerialization;
	while {true} do {
		_display = findDisplay 46;
		if(!isNull(_display)) exitWith {};
		diag_log format ["Failed to get display (%1)", _display];
		sleep 1;
	};
	_display displaySetEventHandler ["KeyDown", "_this call keysDown"];
};

if(getNumber(configFile >> "CfgVehicles" >> (typeOf player) >> "canCarryBackPack") != 1) then {
	player addEventHandler ["WeaponDisassembled", {
		hint parseText "<t size='2' color='#ff0000'>Epic fail</t><br/>Whoops, looks like you disassembled weapon. Tough luck, you can't put it pack together without help of somebody who can carry backpacks.<br/><br/>If you find this unacceptable, please upvote<br/><br/><t color='#9999ff'>https://dev-heaven.net/issues/37569</t><br/><br/>so BIS can fix this problem.";
		player sideChat "https://dev-heaven.net/issues/37569";
	}];
};

client_initComplete = true;

[] call client_updateMissionsMarkers;

[] spawn client_initShopsMarkers;

[] execVM "core\client_playerIcons.sqf";
[] execVM "core\misc\client_teleportCheck.sqf";
[] execVM "core\misc\client_treesCheck.sqf";

[] spawn {
	while{true} do {
		{if(isNull(call compile format["%1", vehicleVarName _x])) then {_x call compile format["%1 = _this", vehicleVarName _x];};} forEach playableUnits;
		sleep 30;
	};
};