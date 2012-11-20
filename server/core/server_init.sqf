if(!X_Server) exitWith {};

pvar_teamKillList = [];
publicVariable "pvar_teamKillList";

pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";

[] execVM "server\core\scripts\functions\client_TimeInMins.sqf";
[] execVM "server\core\scripts\startup\serverCompile.sqf";
[] execVM "server\core\scripts\startup\wasteland_spawn.sqf";

// <editor-fold desc="Friendly Fire Fix">
// Friendly Fire Fix Created by Armynator.
// 01/11/2012
EAST setFriend [WEST, 0];
EAST setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 0];
WEST setFriend [EAST, 0];
WEST setFriend [WEST, 1];
WEST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [EAST, 0];
RESISTANCE setFriend [RESISTANCE, 1];
RESISTANCE setFriend [WEST, 0];
CIVILIAN setFriend [EAST, 0];
CIVILIAN setFriend [WEST, 0];
CIVILIAN setFriend [RESISTANCE, 0];
//</editor-fold>

if (CVG_SideMissions == 1) then {
    diag_log format["WASTELAND SERVER - Execute Mission Selector"];
    [] execVM "server\core\missions\mainmission_selector.sqf";
};

[nil,nil,"per",rSIDECHAT,"Enjoy the game."] call RE;

LHD1 call BIS_EW_fnc_createLHD;