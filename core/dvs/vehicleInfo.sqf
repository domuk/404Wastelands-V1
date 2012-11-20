//determines the vehicles random properties
private ["_marker","_cartype","_car","_num","_tipped","_carpos","_type","_townpos"];
_type = _this select 1;
_townpos = _this select 0;

if (_type == 0) then {
_cartype = carsArray call BIS_fnc_selectRandom; //picks a cartype
if(isNil {_cartype}) then {diag_log format["Error _cartype not defined because of the type - %1", _type];};
_car = createVehicle [_cartype,_townpos,[], 20,"None"] ; 	// creates car
if(isNil {_car}) exitwith{diag_log("Error: _car is not defined!");};
_car setpos [getpos _car select 0,getpos _car select 1,0];
clearMagazineCargoGlobal _car;
clearWeaponCargoGlobal _car;

_car setFuel (0.40);
_car setDamage (0.15);
_car setDir (random 360);
_num = (random 100);
if (_num < 0.5) then { _car addWeaponCargoGlobal ["ItemMap",1];};
_car setVehicleAmmo (random .3);

if (CVG_weaponcount != 101) then {
_number = floor (random 100);
if (_number < CVG_weaponcount) then {
[_car] call RandomWeapons;
};
} else {
[_car] call RandomWeapons;
};
};

if (_type == 1) then {
if (vehspawntype == 0) then {
_cartype = militaryvehs call BIS_fnc_selectRandom; //picks a cartype
} else {
_cartype = carsArray call BIS_fnc_selectRandom; //picks a cartype
};
_car = createVehicle [_cartype,_townpos, [], 30, "None"] ; 	// creates car
clearMagazineCargoGlobal _car;
clearWeaponCargoGlobal _car;
if (cvg_debug == 2) then {
		_marker=createMarker [format ["mark%1",random 100000],getpos _car];
		_marker setMarkerType "Dot";
		_marker setMarkerColor "ColorBlack";
		_marker setMarkerSize [1,1];
};
_car setFuel (0.40);
_car setDamage (0.15);

_car setDir (random 360);

_num = (random 100);
if (_num < 1) then { _car addWeaponCargoGlobal ["ItemMap",1];};
_car setVehicleAmmo (random .6);

if (CVG_weaponcount != 101) then {
_number = floor (random 100);
if (_number < CVG_weaponcount) then {
[_car] call RandomWeapons;
};
};
_carpos = getpos _car;
_car setpos _carpos;
};
if((_car isKindOf "HMMWV_Base")||(_car isKindOf "SUV_Base_EP1")||(_car isKindOf "UAZ_Base") || (_car isKindOf "LandRover_Base") || (_car isKindOf "MTVR")) then {
[_car, 1, 2] execVM "scripts\NEO_tfs\TFS_vehicle.sqf";
};
