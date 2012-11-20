#include "dialog\defines.sqf"; 
if(isnil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
_generalDialog = createDialog "generalShopDialog";

disableSerialization;


_zbandages = _Dialog displayCtrl genshop_money;
_bandages = player getVariable "cmoney";
_zbandages CtrlsetText format["Cash: $%1", _bandages];


_Dialog = findDisplay genshop_dialog;

