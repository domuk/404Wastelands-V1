//Ammo Truck Mission
_wait = [650,150] call fnc_hTime;
sleep _wait;

private ["_rad","_cnps","_hills","_hillcount","_hillnum","_hill","_marker","_boxes","_numb","_boxnum","_box","_picture","_name","_text","_color"];

_rad=20000;
_cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_hills = nearestLocations [_cnps, ["FlatArea"], _rad];
_hillcount = count _hills;
_hillnum = floor (random _hillcount);
_hill = _hills select _hillnum;
_hillpos = getpos _hill;

_marker = createMarker ["YourMarker", _hillpos ];
"YourMarker" setMarkerType "mil_destroy";
"YourMarker" setMarkerSize [1.25, 1.25];
"YourMarker" setMarkerText "Abandoned Ammo Truck";
"YourMarker" setMarkerColor "ColorRed";

mtvrfuel = createVehicle ["MTVR_Reammo",[(getpos _hill select 0) + 30, getpos _hill select 1,0],[], 0, "NONE"];

	_color = "#C5C5C5";
	_name = getText (configFile >> "cfgVehicles" >> typeOf mtvrfuel >> "displayName");
	_picture = getText (configFile >> "cfgVehicles" >> typeOf mtvrfuel >> "picture");

	_text = parseText format ["<t align='center' color='#0362f3' shadow='1' shadowColor='#000000' size='1.5'>Mission Objective</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#666c3f' shadow='1' shadowColor='#000000'><t color='%3'><img size='4' image='%2'/></t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>This <t color='#FFCC33'>%1</t>, is your OBJECTIVE!</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Get to it first!</t>",   _name, _picture, _color 
        ];
       
      [nil,nil,rHINT,_text] call RE; 

waitUntil{{ isPlayer _x && _x distance mtvrfuel < 20  } count playableunits > 0}; 
deleteMarker _marker;

_text2 = parseText format ["<t align='center' color='#0362f3' shadow='1' shadowColor='#000000' size='1.5'>Mission Complete</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#666c3f' shadow='1' shadowColor='#000000'><t color='%3'><img size='4' image='%2'/></t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>Capture the <t color='#FFCC33'>%1</t>, has been completed!</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Mobile Re-fuel Your Vehicles!</t>",   _name, _picture, _color 
        ];
        
        [nil,nil,rHINT,_text2] call RE;