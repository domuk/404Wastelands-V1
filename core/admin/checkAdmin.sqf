_uid = "";
_uid = getPlayerUID player;

_validUIDList = ["18836358","20243782","18519302","32879878"];

if (_uid in _validUIDList) then {
    player execVM "core\admin\adminMenu.sqf"; 
    hint "Welcome Admin";
    //isitadmin = true;
} 
else {
    sleep 1;
    _handle = player execVM "core\admin\checkAdmin2.sqf"; 
    waitUntil {scriptDone _Handle};
};