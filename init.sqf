X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

versionName = "v1.2c";

[] execVM "briefing.sqf"; //Load Briefing

if(isServer) then { X_Server = true;};
if(!isDedicated) then { X_Client = true;};
if(isNull player) then {X_JIP = true;};

true spawn {
	if(!isDedicated) then {
		titleText ["Loading...", "PLAIN", 1];
		waitUntil {player == player};
		client_initEH = player addEventHandler ["Respawn", {removeAllWeapons (_this select 0);}];
	};
};

hitStateVar = false;
enableSaving[false,false];

//init Wasteland Core
[] call compile preprocessFileLineNumbers "core\misc\compile.sqf"; //Load precompiled commands
[] call compile preprocessFileLineNumbers "core\init.sqf";

[] call compile preprocessFileLineNumbers "proving_Ground\init.sqf";

//init 3rd Party Scripts
[] execVM "R3F_ARTY_AND_LOG\init.sqf";
//[] execVM "core\misc\DynamicWeatherEffects.sqf";

if(X_JIP) then {[] execVM "core\onJIP.sqf";};
