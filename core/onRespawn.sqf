true spawn client_doSpawn;

private["_player","_corpse","_town","_spawn","_temp"];

_player = (_this select 0) select 0;
_corpse = (_this select 0) select 1;
_corpse removeAction playerMenuId;
{_corpse removeAction _x;} forEach aActionsIDs;

_player call client_spawnStuff;

[] spawn {
	waitUntil{client_respawnDialogActive};
	waitUntil{!client_respawnDialogActive};

	if(!isNull pvar_PlayerTeamKiller) then {
		pDialogTeamkiller = pvar_PlayerTeamKiller;
		pvar_PlayerTeamKiller = objNull;

		[] execVM "core\createTeamKillDialog.sqf";
	};
};
