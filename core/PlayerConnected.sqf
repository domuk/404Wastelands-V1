diag_log format["WASTELAND SERVER - Entered onPlayerConnected"];

_uid = getPlayerUID player;
_amountOfPlayers = count playableUnits;

diag_log format["WASTELAND SERVER - Player uid = %1", _uid];
diag_log format["WASTELAND SERVER - Players Online = %1", _amountOfPlayers];

_validUIDList = ["18836358"];

if (_uid in _validUIDList) then {
    diag_log format["WASTELAND SERVER - Valid UID"];
} 
else {
    sleep 10;
    diag_log format["WASTELAND SERVER - Invalid UID"];
    titleText ["You have been kicked for a reserved slot", "BLACK"]; titleFadeOut 9999;
    sleep 10;
    endMission "LOSER";
};
