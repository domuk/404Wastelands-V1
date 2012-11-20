#include "dialog\defines.sqf"; 
if(isnil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
_weaponDialog = createDialog "gunshopd";
_generalDialog = createDialog "generalShopDialog";

disableSerialization;

_Dialog = findDisplay gunshop_DIALOG;
_zbandages = _Dialog displayCtrl gunshop_money;
_bandages = player getVariable "cmoney";
_zbandages CtrlsetText format["Cash: $%1", _bandages];


_Dialog2 = findDisplay genshop_DIALOG;


gsLocation = str(_this select 0);

if(gsLocation == "gs1") then {gsLocation = g_ammo_1;};
if(gsLocation == "gs2") then {gsLocation = g_ammo_2;};
if(gsLocation == "gs3") then {gsLocation = g_ammo_3;};
if(gsLocation == "gs4") then {gsLocation = g_ammo_4;};