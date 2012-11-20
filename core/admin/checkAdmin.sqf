_uid = "";
_uid = getPlayerUID player;

if (_uid in adminPanelUIDS) then {
    player execVM "core\admin\adminMenu.sqf"; 
    hint "Welcome Admin";
    //isitadmin = true;
} 
else {
    sleep 1;
    _handle = player execVM "core\admin\checkAdmin2.sqf"; 
    waitUntil {scriptDone _Handle};
};