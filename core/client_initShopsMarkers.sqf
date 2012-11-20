private ["_status", "_gs_array", "_col_empty", "_col_enemy", "_col_friendly", "_radius", "_genshop_array", "_bastard_array"];

_gs_array = ["gs1", "gs2", "gs3", "gs4"];
_genshop_array = ["generalStore1","generalStore2","generalStore3","generalStore4","generalStore5"];
_bastard_array = ["gs1", "gs2", "gs3", "gs4","generalStore1","generalStore2","generalStore3","generalStore4","generalStore5"];
_col_empty = "ColorBlue";
_col_enemy = "ColorRed";
_col_friendly = "ColorGreen";
_col_mixed = "ColorOrange";
_radius = 200;
_status = [];

//EMPTY
//ENEMY
//FRIENDLY
//MIXED

waitUntil {{!isNull(missionNamespace getVariable _x) && ((getPos(missionNamespace getVariable _x) distance [0,0,0]) > 100)} count _gs_array == count _gs_array};

{
	_unit = missionNamespace getVariable _x;

	// Circle zone
	_mname = format ["shop_zone_%1", _x];
	deleteMarkerLocal _mname;
	_marker = createMarkerLocal [_mname, getPos _unit];
	_mname setMarkerShapeLocal "ELLIPSE";
	_mname setMarkerColorLocal _col_empty;
	_mname setMarkerSizeLocal [_radius, _radius];
	_mname setMarkerBrushLocal "Grid";
	_mname setMarkerAlphaLocal 0.5;

	// Gun store title
	_mname = format ["shop_title_%1", _x];
	deleteMarkerLocal _mname;
	_marker = createMarkerLocal [_mname, getPos _unit];
	_mname setMarkerShapeLocal "ICON";
	_mname setMarkerTypeLocal "Dot";
	_mname setMarkerColorLocal "ColorRed";//"ColorBlack";
	_mname setMarkerSizeLocal [0.8,0.8];
	_mname setMarkerTextLocal (localize "STR_WL_Shop_Marker_GunStore");

	// Gun store description
	_mname = format ["shop_desc_%1", _x];
	deleteMarkerLocal _mname;
	_pos = getPos _unit; _pos set [1, (_pos select 1) - 190];
	_marker = createMarkerLocal [_mname, _pos];
	_mname setMarkerShapeLocal "ICON";
	_mname setMarkerTypeLocal "mil_dot";
	_mname setMarkerColorLocal _col_empty;//"ColorBlack";
	_mname setMarkerSizeLocal [0.8,0.8];
	_mname setMarkerTextLocal (localize "STR_WL_Shop_Marker_Empty");
	_mname setMarkerAlphaLocal 0.5;

	_status set [count _status, "EMPTY"];
} forEach _gs_array;

waitUntil {{!isNull(missionNamespace getVariable _x) && ((getPos(missionNamespace getVariable _x) distance [0,0,0]) > 100)} count _genshop_array == count _genshop_array};

{
	_unit = missionNamespace getVariable _x;

	// Circle zone
	_mname = format ["shop_zone_%1", _x];
	deleteMarkerLocal _mname;
	_marker = createMarkerLocal [_mname, getPos _unit];
	_mname setMarkerShapeLocal "ELLIPSE";
	_mname setMarkerColorLocal _col_empty;
	_mname setMarkerSizeLocal [_radius, _radius];
	_mname setMarkerBrushLocal "Grid";
	_mname setMarkerAlphaLocal 0.5;

	// General store title
	_mname = format ["shop_title_%1", _x];
	deleteMarkerLocal _mname;
	_marker = createMarkerLocal [_mname, getPos _unit];
	_mname setMarkerShapeLocal "ICON";
	_mname setMarkerTypeLocal "Dot";
	_mname setMarkerColorLocal "ColorOrange";//"ColorBlack";
	_mname setMarkerSizeLocal [0.8,0.8];
	_mname setMarkerTextLocal (localize "STR_WL_Shop_Marker_GenStore");

	// General store description
	_mname = format ["shop_desc_%1", _x];
	deleteMarkerLocal _mname;
	_pos = getPos _unit; _pos set [1, (_pos select 1) - 190];
	_marker = createMarkerLocal [_mname, _pos];
	_mname setMarkerShapeLocal "ICON";
	_mname setMarkerTypeLocal "mil_dot";
	_mname setMarkerColorLocal _col_empty;//"ColorBlack";
	_mname setMarkerSizeLocal [0.8,0.8];
	_mname setMarkerTextLocal (localize "STR_WL_Shop_Marker_Empty");
	_mname setMarkerAlphaLocal 0.5;

	_status set [count _status, "EMPTY"];
} forEach _genshop_array;

private ["_fcnt", "_ecnt", "_unit", "_fnc_set_status"];

_fnc_set_status = {
	if(_status select (_this select 0) == (_this select 1)) exitWith {};

	_mname_z = format ["shop_zone_%1", _bastard_array select (_this select 0)];
	_mname_d = format ["shop_desc_%1", _bastard_array select (_this select 0)];
	switch(_this select 1) do {
		case "EMPTY": {
			_mname_z setmarkerColorLocal _col_empty;
			_mname_d setmarkerColorLocal _col_empty;
			_mname_d setMarkerTextLocal (localize "STR_WL_Shop_Marker_Empty");
		};
		case "ENEMY": {
			_mname_z setmarkerColorLocal _col_enemy;
			_mname_d setmarkerColorLocal _col_enemy;
			_mname_d setMarkerTextLocal (localize "STR_WL_Shop_Marker_Enemy");
		};
		case "FRIENDLY": {
			_mname_z setmarkerColorLocal _col_friendly;
			_mname_d setmarkerColorLocal _col_friendly;
			_mname_d setMarkerTextLocal (localize "STR_WL_Shop_Marker_Friendly");
		};
		case "MIXED": {
			_mname_z setmarkerColorLocal _col_mixed;
			_mname_d setmarkerColorLocal _col_mixed;
			_mname_d setMarkerTextLocal (localize "STR_WL_Shop_Marker_Mixed");
		};
	};

	if((_this select 2) && ((_this select 1) in ["ENEMY", "MIXED"])) then {
		hintSilent parseText format ["<t size='2' color='#ff0000'>%1</t><br/><br/>%2.",
			localize "STR_WL_Gen_Warning",
			localize "STR_WL_Shop_Message_EnemyApproaching"
		];
	};

	_status set [_this select 0, _this select 1];
};

showmarkers = true;
while {showmarkers} do {
	for "_i" from 0 to (count _bastard_array - 1) do {
		_unit = missionNamespace getVariable (_bastard_array select _i);
		_fcnt = 0;
		_ecnt = 0;
		{
			if((_x distance _unit < _radius) && (player != _x)) then {
				if(playerSide in [west,east] && playerSide == side _x) then {
					_fcnt = _fcnt + 1;
				} else {
					_ecnt = _ecnt + 1;
				};
			};
		} forEach playableUnits;

		if(player distance _unit < _radius) then {
			if(_ecnt > 0) then {
				if(_fcnt > 0) then {
					[_i, "MIXED", true] call _fnc_set_status;
				} else {
					[_i, "ENEMY", true] call _fnc_set_status;
				};
			} else {
				[_i, "FRIENDLY", true] call _fnc_set_status;
			};
		} else {
			if(_ecnt > 0) then {
				if(_fcnt > 0) then {
					[_i, "MIXED", false] call _fnc_set_status;
				} else {
					[_i, "ENEMY", false] call _fnc_set_status;
				};
			} else {
				if(_fcnt > 0) then {
					[_i, "FRIENDLY", false] call _fnc_set_status;
				} else {
					[_i, "EMPTY", false] call _fnc_set_status;
				};
			};
		};
	};
  
	sleep 1;  
};