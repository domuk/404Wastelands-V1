/*
	@file Version: 1.3
	@file name: core\misc\fnc_hud.sqf
	@file Author: 404Games - Deadbeat
	@file edit: 11/09/2012
	@file description: This controls the hud / UI for food / water
*/

disableSerialization;
private["_ui","_hud","_food","_water"];

while {true} do
{
    cutRsc ["WastelandHud","PLAIN"];
    _ui = uiNameSpace getVariable "WastelandHud";
    _vitals = _ui displayCtrl 3600;
    _hudVehicle = _ui displayCtrl 3601;
    
    //Calculate Health 0 - 100
    _decimalPlaces = 2;
    _health = damage player;
    _health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
    _health = 100 - (_health * 100);
    
    _vitals ctrlSetStructuredText parseText format ["%1 <img size='0.8' image='player_system\icons\health.paa'/><br/>%2 <img size='0.8' image='player_system\icons\f.paa'/><br/>%3 <img size='0.8' image='player_system\icons\w.paa'/><br/>%4 <img size='0.8' image='\CA\misc\data\icons\picture_money_CA.paa'/>", _health, hungerLevel, thirstLevel, (player getVariable "cmoney")];
    _vitals ctrlCommit 0;
        
    if(player != vehicle player) then
    {
        _tempString = "";
        _yOffset = 0.24;
        _vehicle = assignedVehicle player;

        {
            _tempString = format ["%1 %2 <img size='0.8' image='player_system\icons\leftArrow.paa'/><br/>",_tempString, (name _x)];
            _yOffset = _yOffset + 0.04;
        } forEach crew _vehicle;

        _hudVehicle ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _hudVehicle ctrlSetPosition [_x, _y, 0.4, 0.65];
        _hudVehicle ctrlCommit 0;
    };
        
    sleep 1;
};