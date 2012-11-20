/*
	@file Version: 1D
	@file name: core\misc\fnc_hud.sqf
	@file Author: TAW_Tonic
	@file edit: 9/28/2012
	@file description: This controls the hud / UI for food / water
*/

disableSerialization;
private["_ui","_hud","_food","_water"];

while {true} do
{
	cutRsc ["WastelandHud","PLAIN"];
	_ui = uiNameSpace getVariable "WastelandHud";
	_food = _ui displayCtrl 3600;
	
	_food ctrlSetStructuredText parseText format ["%1 <img size='0.8' image='player_system\icons\f.paa'/><br/>%2 <img size='0.8' image='player_system\icons\w.paa'/><br/>%3 <img size='0.8' image='\CA\misc\data\icons\picture_money_CA.paa'/>", hungerLevel, thirstLevel, (player getVariable "cmoney")];
	_food ctrlCommit 0;
	
sleep 1;
};