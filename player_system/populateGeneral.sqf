#include "dialog\defines.sqf";
#include "itemList.sqf";
disableSerialization;

if (local player) then {

	// Grab access to the controls
	_dialog = findDisplay genshop_dialog;
	_itemListText = _dialog displayCtrl genshop_item_text;
	_itemList = _dialog displayCtrl genshop_item;


	// Populate the general shop item list
	{_itemListIndex = _itemList lbAdd format["%1",_x select 0];} forEach itemArray;
};