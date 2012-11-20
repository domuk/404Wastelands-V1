#include "dialog\defines.sqf";
#include "itemList.sqf";
if(isnil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
disableSerialization;

_switch = _this select 0;

_dialog2 = findDisplay genshop_dialog;
_itemListText = _dialog2 displayCtrl genshop_item_text;
_itemList = _dialog2 displayCtrl genshop_item;
_itemInfo = Lbselection _itemlist select 0;
_zbandages = _dialog2 displayCtrl genshop_money;
_invslots = [player] call BIS_fnc_invSlots;
_invfree = [player] call BIS_fnc_invSlotsEmpty;
_bandages = player getVariable "cmoney"; // Bandages = money

_player = _this;


if(isNil {_itemInfo}) then { _itemInfo = 0;};


switch(_switch) do {
	case 0: {
            scopeName "invManagement";
            _price = (itemArray select _itemInfo) select 2;
            _itemEnglish = (itemArray select _itemInfo) select 0; // Item name in plain-text English (easy to read).
            _itemClassName = (itemArray select _itemInfo) select 1; // Item class-name for spawning
            _currItemAmount = player getVariable _itemClassName;
            
            if(_bandages < _price) exitwith {hint "You do not have enough cash."};
            
            // This IF block is all a dirty hack due to boolean values not evaluating correctly in Arma 2 (thanks, Bohemia...)
            if(_itemClassName == "fuelFull" or _itemClassName == "fuelEmpty") then {
                
                if (_currItemAmount) then {breakOut "invManagement"}; // If the user already has one of what he's trying to buy, exit.. TODO: Add a message to that effect.
                player setVariable[_itemClassName,true,false];
                player setVariable["cmoney",_bandages - _price,false];
                hint format["You have purchased 1 %1 for $%2", _itemEnglish, _price];
              
                if(_itemClassName == "fuelFull" or _itemClassName == "fuelEmpty") then {breakOut "invManagement"}; // After purchasing a can, exit and do not evaluate the below conditions thus causing a script error.
            };
            
            if(_currItemAmount >= 4) exitwith {hint "You already have the maximum amount of that item."}; // Maximum amount of anything stackable is 4.
            
            _incrementedItemAmount = _currItemAmount + 1;
            
            player setVariable[_itemClassName,_incrementedItemAmount,false]; 
            player setVariable["cmoney",_bandages - _price,false];
            _zbandages CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
            hint format["You have purchased 1 %1 for $%2", _itemEnglish, _price];
           
           // Need to look into adding this control back into the dialog. It seems to have been removed by accident. For another day, methinks.
            //_zbandages CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
	};
};
