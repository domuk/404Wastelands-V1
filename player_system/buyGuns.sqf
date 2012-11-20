#include "dialog\defines.sqf";
#include "weaponlist.sqf";
if(isnil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
disableSerialization;

_switch = _this select 0;

_dialog2 = findDisplay gunshop_DIALOG;
_gunlisttext = _dialog2 displayCtrl gunshop_gun_TEXT;
_gunlist = _dialog2 displayCtrl gunshop_gun;
_magtext = _dialog2 displayCtrl gunshop_mags_text;
_ammodialog = _dialog2 displayCtrl gunshop_mags;
_ammoamount = lbCurSel _ammodialog;
_gunInfo = Lbselection _gunlist select 0;
_zbandages = _dialog2 displayCtrl gunshop_money;
_invslots = [player] call BIS_fnc_invSlots;
_invfree = [player] call BIS_fnc_invSlotsEmpty;
_bandages = player getVariable "cmoney";
if(isNil {_gunInfo}) then { _gunInfo = 0;};

//hint format ["%1", gslocation];

switch(_switch) do 
{
	case 0: 
	{
		_price = (weaponsArray select _gunInfo) select 2;
		if(_bandages < _price) exitwith {hint "You do not have enough cash"};
		player setVariable["cmoney",_bandages - _price,false];

		//player addWeapon _weap_type;
		gsLocation addWeaponCargoGlobal [((weaponsArray select _gunInfo) select 1),1];
		_zbandages CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
	};
	
	case 1:
	{
		_ammoInfo = lbText[gunshop_mags, _ammoamount];
		_price2 = (weaponsArray select _gunInfo) select 4;
		if(!(_ammoInfo in ["1","2","3","4","5","6","7","8","9","10","11","12"])) exitwith {hint "You have not selected the amount of magazines you want.";};
		_tmp = (weaponsArray select _gunInfo) select 1;
		if(_tmp == "NVGoggles") exitwith {};
		_price = (parseNumber _ammoInfo)*_price2;
		if(_bandages < _price) exitwith {hint "You do not have enough cash"};
		player setVariable["cmoney",_bandages - _price,false];

		gsLocation addMagazineCargoGlobal [((weaponsArray select _gunInfo) select 3),(parseNumber _ammoInfo)];
	
		_zbandages CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
	};
};
