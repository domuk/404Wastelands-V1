#include "dialog\rogue.sqf"; 
_playerDialog = createDialog "rogueList";
disableSerialization;

private["_Dialog","_foodtext","_watertext","_moneytext","_mvalue","_rogue"];


_Dialog = findDisplay rogue_DIALOG;
_roglist = _Dialog displayCtrl rogue_field;

{
if(side _x == resistance) then {
_rIndex = _roglist lbAdd format["%1", name  _x];
};
} foreach playableUnits;