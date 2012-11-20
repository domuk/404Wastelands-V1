[] call (compile preprocessFileLineNumbers "core\init_towns.sqf");

if(X_Server) then {
        [] execVM "server\core\scripts\startup\wasteland_init.sqf";
	[] execVM "server\core\server_init.sqf";
};
if(!isDedicated) then {
	[] execVM "core\client_init.sqf";
};
[0, 0] execFSM "server\core\scripts\fsm\core_time.fsm";