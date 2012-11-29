[] call (compile preprocessFileLineNumbers "core\init_towns.sqf");

//Public Vars


if(X_Server) then {
    //[] execVM "server\core\scripts\startup\wasteland_init.sqf";
    //[] execVM "server\core\server_init.sqf";
};
if(!isDedicated) then {
    [] execVM "core\client_init.sqf";
};
[1] execFSM "core\core_time.fsm";