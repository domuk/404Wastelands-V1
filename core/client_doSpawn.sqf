client_inRespawn = true;
playerUID = getPlayerUID(player);

doKickTeamKiller = false;
doKickTeamSwitcher = false;

//Check Teamkiller
{
	if(_x select 0 == playerUID) then {
        
		if((_x select 1) >= 2) then {
			if(playerSide in [west, east]) then {
				doKickTeamKiller = true;
			};
		};
	};
} forEach pvar_teamKillList;

//Check Teamswitcher
_side = "";
{
	if(_x select 0 == playerUID) then
    {
        if(playerSide != (_x select 1) && str(playerSide) != "GUER") then{
        	doKickTeamSwitcher = true;
			_side = str(_x select 1);
        };	
	};
} forEach pvar_teamSwitchList;

//Kick for appropriate reason

//Teamkiller Kick
if(doKickTeamKiller) exitWith {
	titleText ["", "BLACK IN", 0];
	titleText [localize "STR_WL_Loading_Teamkiller", "black"]; titleFadeOut 9999;
	[] spawn {sleep 20; endMission "LOSER";};
};

//Teamswitcher Kick
if(doKickTeamSwitcher) exitWith {
	titleText ["", "BLACK IN", 0];
	titleText [format[localize "STR_WL_Loading_Teamswitched", localize format ["STR_WL_Gen_Team%1_2", _side]], "black"]; titleFadeOut 9999;
	[] spawn {sleep 20; endMission "LOSER";};
};

//Client Spawn
player setPos [-20000 - (random 10000), 5000 + random 15000, 0];

titleText ["Loading...", "BLACK OUT", 0.00001];
waitUntil {!isNil {BIS_fnc_init}};
waitUntil {client_compiledScripts};
waitUntil {time > 0};

private ["_handle"];
true spawn client_respawnDialog;

waitUntil {client_respawnDialogActive};

while {client_respawnDialogActive} do {
	titleText ["", "BLACK OUT", 0.00001];
};
sleep 0.1;

titleText ["", "BLACK IN", 0.00001];

client_inRespawn = false;