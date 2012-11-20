#include "dialog\defines.sqf";
#include "itemList.sqf";
disableSerialization;

_switch = _this select 0;

_dialog2 = findDisplay genshop_dialog; // Why dialog2?
_itemListText = _dialog2 displayCtrl genshop_item_text;
_itemList = _dialog2 displayCtrl genshop_item;
_itemInfoText = _dialog2 displayCtrl genshop_item_info;
_itemInfo = Lbselection _itemList select 0;

if(isNil {_itemInfo}) then { _itemInfo = 0;};
_itemType = ((itemArray select _itemInfo) select 1); // Select them item NAME from the item array.

switch(_switch) do 
{
	case 0: 
	{
		_price = (itemArray select _itemInfo) select 2; // Select the item PRICE from the item array.
		_lb = parsetext "<br/>"; // This is initialised as a local var because it needs to be pre-parsed for some retarded reason.
                
                _temp = (itemArray select _itemInfo) select 3; // Select the item DESCRIPTION from the itrm array.
                _text = composeText["Item information: ",_lb,_lb,parseText _temp];
                
		_itemInfoText ctrlSetStructuredText _text;
		_itemListText ctrlSetText format ["Price: $%1", _price];
	};
};
		