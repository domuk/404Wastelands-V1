client_inRespawn = true;

/*if(playerSide == resistance) exitWith {
	waitUntil {time > 0};
	waitUntil {!isNil "client_initComplete"};
	waitUntil {player == player};
	-1 call client_respawnAction;
	titleText ["", "BLACK IN", 0.00001];

	client_inRespawn = false;
};*/

player setPos [-20000 - (random 10000), 5000 + random 15000, 0];

titleText ["Loading...", "BLACK OUT", 0.00001];
waitUntil {!isNil {BIS_fnc_init}};
waitUntil {client_compiledScripts};
waitUntil {time > 0};

private ["_handle"];
true spawn client_respawnDialog;

waitUntil {client_respawnDialogActive};

/*if(!dialog) exitWith {
	//Shit went wrong
	player call client_randomSpawn;
	titleText ["", "BLACK IN", 0.00001];

	client_inRespawn = false;
};*/

while {client_respawnDialogActive} do {
	titleText ["", "BLACK OUT", 0.00001];
};
sleep 0.1;

titleText ["", "BLACK IN", 0.00001];

client_inRespawn = false;