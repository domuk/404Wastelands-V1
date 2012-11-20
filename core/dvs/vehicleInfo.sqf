//determines the vehicles random properties
private ["_marker","_cartype","_car","_num","_tipped","_carpos","_type","_townpos"];
_type = _this select 1;
_townpos = _this select 0;

if (_type == 0) then {
    _cartype = carsArray call BIS_fnc_selectRandom; //picks a cartype
    if(isNil {_cartype}) then {diag_log format["Error _cartype not defined because of the type - %1", _type];};
    _car = createVehicle [_cartype,_townpos,[], 20,"None"] ; 	// creates car
	_car setVehicleInit "nul=[this, 300, 3600, 0, false] execVM 'vehicle.sqf'";
	processInitCommands;

    if(isNil {_car}) exitwith{diag_log("Error: _car is not defined!");};
    
    _car setpos [getpos _car select 0,getpos _car select 1,0];
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

    _car setFuel (0.40);
    _car setDamage (0.15);
    _car setDir (random 360);
    _car setVehicleAmmo (random .3);
    [_car] call RandomWeapons;
};

if (_type == 1) then {
    _cartype = militaryvehs call BIS_fnc_selectRandom; //picks a cartype
    _car = createVehicle [_cartype,_townpos, [], 30, "None"] ; 	// creates car
    _car setVehicleInit "nul=[this, 300, 0, 0, false] execVM 'vehicle.sqf'";
	processInitCommands;
    _car setpos [getpos _car select 0,getpos _car select 1,0];
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

    _car setFuel (0.40);
    _car setDamage (0.15);
    _car setDir (random 360);
    _car setVehicleAmmo (random .6);
    [_car] call RandomWeapons;
};
