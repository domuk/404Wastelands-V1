if(!local player) exitwith {};
{
	if((getMarkerPos _x) distance player < 200) then {
		if((_this select 0 select 4) isKindOf "TimeBombCore") then {
			hint parseText format ["<t size='2' color='#ff0000'>%1</t><br/><br/>%2.",
				localize "STR_WL_Gen_Warning",
				localize "STR_WL_Shop_Message_NoMines"
			];
		};
	};
} foreach ["gs1","gs2","gs3","gs4"];