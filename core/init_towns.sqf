private["_arr", "_loc", "_loc_pos", "_loc_rad", "_loc_name", "_loc_rate", "_loc_pos2", "_loc_rad2"];

aTownsFull = [];

/*{deleteMarker _x;} forEach todel;
todel = [];*/

_center = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_center set [2, 0];
_center_x = _center select 0;
_center_y = _center select 1;
_center_r = (_center_x min _center_y) / 3;

//_loc_rate = 0.013;
_loc_rate = 0.03;
_arr = configFile >> "CfgWorlds" >> worldName >> "Names";
for "_i" from 0 to (count _arr)-1 do {
	_loc = (_arr select _i);
	if((getText(_loc >> "type") == "CityCenter")) then {

		_loc_name = configName(_loc);
		_loc_pos = getArray(_loc >> "position");
		_loc_rad = getNumber(_loc >> "radiusa");
		_loc_real_name = "";
		_loc_part = 0;
		/* Center:0 NW:1 NE:2 SE:3 SW:4*/

		switch(worldName) do {
			case "Chernarus": {
				switch(_loc_name) do {
					case "ACityC_Chernogorsk":	{_loc_rad = _loc_rad * 5;	_loc_real_name = "city_Chernogorsk";};
					case "ACityC_Balota":		{_loc_rad = _loc_rad * 1.5;	_loc_real_name = "vill_Balota";};
					case "ACityC_Komarovo":		{_loc_rad = _loc_rad * 2.2;	_loc_real_name = "vill_Komarovo";};
					case "ACityC_Kamenka":		{_loc_rad = _loc_rad * 2;	_loc_real_name = "vill_Kamenka";};
					case "ACityC_Pavlovo":		{_loc_rad = _loc_rad * 2;	_loc_real_name = "vill_Pavlovo";};
					case "ACityC_Bor":		{_loc_rad = _loc_rad * 1.2;	_loc_real_name = "vill_Bor";};
					case "ACityC_Zelenogorsk":	{_loc_rad = _loc_rad * 3.5;	_loc_real_name = "city_Zelenogorsk";};
					case "ACityC_Drozhino":		{_loc_rad = _loc_rad * 1;	_loc_real_name = "vill_Drozhino";};
					case "ACityC_Kozlovka":		{_loc_rad = _loc_rad * 1.8;	_loc_real_name = "vill_Kozlovka";};
					case "ACityC_Sosnovka":		{_loc_rad = _loc_rad * 1.5;	_loc_real_name = "vill_Sosnovka";};
					case "ACityC_Pulkovo":		{_loc_rad = _loc_rad * 1;	_loc_real_name = "vill_Pulkovo";};
					case "ACityC_Pogorevka":	{_loc_rad = _loc_rad * 1.2;	_loc_real_name = "vill_Pogorevka";};
					case "ACityC_Rogovo":		{_loc_rad = _loc_rad * 1.7;	_loc_real_name = "vill_Rogovo";};
					case "ACityC_Myshkino":		{_loc_rad = _loc_rad * 1.3;	_loc_real_name = "vill_Myshkino";};
					case "ACityC_Pustoshka":	{_loc_rad = _loc_rad * 2.5;	_loc_real_name = "vill_Pustoshka";};
					case "ACityC_Vybor":		{_loc_rad = _loc_rad * 3;	_loc_real_name = "city_Vybor";};
					case "ACityC_Lopatino":		{_loc_rad = _loc_rad * 2.8; _loc_pos set [0, (_loc_pos select 0) - 100]; _loc_pos set [1, (_loc_pos select 1) - 100];	_loc_real_name = "vill_Lopatino";};
					case "ACityC_Kabanino":		{_loc_rad = _loc_rad * 2.1;	_loc_real_name = "vill_Kabanino";};
					case "ACityC_Grishino":		{_loc_rad = _loc_rad * 2.5;	_loc_real_name = "vill_Grishino";};
					case "ACityC_Petrovka":		{_loc_rad = _loc_rad * 1.5;	_loc_real_name = "vill_Petrovka";};
					case "ACityC_StarySobor":	{_loc_rad = _loc_rad * 3.5;	_loc_real_name = "city_StarySobor";};
					case "ACityC_NovySobor":	{_loc_rad = _loc_rad * 2.1;	_loc_real_name = "vill_NovySobor";};
					case "ACityC_Guglovo":		{_loc_rad = _loc_rad * 1;	_loc_real_name = "vill_Guglovo";};
					case "ACityC_Vyshnoye":		{_loc_rad = _loc_rad * 1.8;	_loc_real_name = "vill_Vyshnoye";};
					case "ACityC_Mogilevka":	{_loc_rad = _loc_rad * 2.1;	_loc_real_name = "vill_Mogilevka";};
					case "ACityC_Nadezhdino":	{_loc_rad = _loc_rad * 2.3;	_loc_real_name = "vill_Nadezhdino";};
					case "ACityC_Prigorodki":	{_loc_rad = _loc_rad * 2.6;	_loc_real_name = "vill_Prigorodki";};
					case "ACityC_Elektrozavodsk":	{_loc_rad = _loc_rad * 4.7; _loc_pos set [0, (_loc_pos select 0) - 90];	_loc_real_name = "city_Elektrozavodsk";};
					case "ACityC_Pusta":		{_loc_rad = _loc_rad * 2; _loc_pos set [1, (_loc_pos select 1) + 90];	_loc_real_name = "vill_Pusta";};
					case "ACityC_Staroye":		{_loc_rad = _loc_rad * 2.3;	_loc_real_name = "vill_Staroye";};
					case "ACityC_Msta":		{_loc_rad = _loc_rad * 1.8;	_loc_real_name = "vill_Msta";};
					case "ACityC_Tulga":		{_loc_rad = _loc_rad * 1.7;	_loc_real_name = "vill_Tulga";};
					case "ACityC_Kamyshovo":	{_loc_rad = _loc_rad * 2;	_loc_real_name = "vill_Kamyshovo";};
					case "ACityC_Solnychniy":	{_loc_rad = _loc_rad * 2.6;	_loc_real_name = "city_Solnychniy";};
					case "ACityC_Dolina":		{_loc_rad = _loc_rad * 2.3;	_loc_real_name = "vill_Dolina";};
					case "ACityC_Shakhovka":	{_loc_rad = _loc_rad * 1;	_loc_real_name = "vill_Shakhovka";};
					case "ACityC_Orlovets":		{_loc_rad = _loc_rad * 1.7;	_loc_real_name = "vill_Orlovets";};
					case "ACityC_Polana":		{_loc_rad = _loc_rad * 2.3;	_loc_real_name = "vill_Polana";};
					case "ACityC_Gorka":		{_loc_rad = _loc_rad * 3.4;	_loc_real_name = "city_Gorka";};
					case "ACityC_Dubrovka":		{_loc_rad = _loc_rad * 2.2;	_loc_real_name = "vill_Dubrovka";};
					case "ACityC_Gvozdno":		{_loc_rad = _loc_rad * 3; _loc_pos set [0, (_loc_pos select 0) + 80]; _loc_pos set [1, (_loc_pos select 1) - 130];	_loc_real_name = "vill_Gvozdno";};
					case "ACityC_Krasnostav":	{_loc_rad = _loc_rad * 3.5; _loc_pos set [0, (_loc_pos select 0) - 100]; _loc_pos set [1, (_loc_pos select 1) + 50];	_loc_real_name = "city_Krasnostav";};
					case "ACityC_Olsha":		{_loc_rad = _loc_rad * 1;	_loc_real_name = "vill_Olsha";};
					case "ACityC_Khelm":		{_loc_rad = _loc_rad * 2.1;	_loc_real_name = "vill_Khelm";};
					case "ACityC_Nizhnoye":		{_loc_rad = _loc_rad * 2;	_loc_real_name = "vill_Nizhnoye";};
					case "ACityC_Berezino":		{
						_loc_pos2 = +_loc_pos;
						_loc_pos2 set [0, (_loc_pos2 select 0) + 400];
						_loc_pos2 set [1, (_loc_pos2 select 1) + 400];
						_loc_rad2 = _loc_rad * 3;
						_loc_real_name = "city_Berezino";
						aTownsFull set [count aTownsFull, [
							(format ["%1_Industrial", _loc_name]),
							_loc_pos2,
							_loc_rad2,
							getText(_loc >> "type"),
							ceil(_loc_rad2 * _loc_rate),
							_loc_real_name,
							2
						]];

						_loc_pos set [0, (_loc_pos select 0) - 450];
						_loc_pos set [1, (_loc_pos select 1) - 450];
						_loc_rad = _loc_rad * 3.7;
					};
				};
			};
		};

		if(_loc_pos distance _center < _center_r) then {
			_loc_part = 0;
		} else {
			if(_loc_pos select 0 < _center_x) then {
				if(_loc_pos select 1 < _center_y) then {
					_loc_part = 4;
				} else {
					_loc_part = 1;
				};
			} else {
				if(_loc_pos select 1 < _center_y) then {
					_loc_part = 3;
				} else {
					_loc_part = 2;
				};
			};
		};

		aTownsFull set [count aTownsFull, [
			_loc_name,
			_loc_pos,
			_loc_rad,
			getText(_loc >> "type"),
			ceil(_loc_rad * _loc_rate),
			_loc_real_name,
			_loc_part
		]];
	};
};

{
	_mname = format["town%1", random 1000000];
	_marker = createMarkerLocal [_mname, (_x select 1)];
	_marker setMarkerShapeLocal "ELLIPSE";
	_mname setMarkerSizeLocal [(_x select 2), (_x select 2)];
	_mname setMarkerColorLocal "ColorBlue";
	_mname setMarkerBrushLocal "SolidBorder";
	_mname setMarkerAlphaLocal 0.3;
} forEach aTownsFull;

/*{
	_mname = format["stuff%1", random 1000000];
	_marker = createMarker [_mname, (_x select 1)];
	_marker setMarkerShape "ELLIPSE";
	_mname setMarkerSize [(_x select 2), (_x select 2)];
	switch(_x select 6) do {
		case 0: {_mname setMarkerColor "ColorBlack";};
		case 1: {_mname setMarkerColor "ColorRed";};
		case 2: {_mname setMarkerColor "ColorGreen";};
		case 3: {_mname setMarkerColor "ColorBlue";};
		case 4: {_mname setMarkerColor "ColorYellow";};
	};
	_mname setMarkerBrushLocal "SolidBorder";
	todel = todel + [_mname];
} forEach aTownsFull;*/
