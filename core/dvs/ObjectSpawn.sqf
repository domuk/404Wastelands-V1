//determines the vehicles random properties
private ["_marker","_cartype","_car","_num","_tipped","_carpos","_type","_townpos"];

_objPos = _this select 0;
_Objtype = objectList call BIS_fnc_selectRandom; //Pick Random Object

_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 

if(_Objtype == "Land_Barrel_water") then 
{
    _obj setVariable["water",20,true];
};

if(_Objtype == "EvMoney") then 
{
    _m = round(random 1000);
    _obj setVariable["money",_m,true];
};

if(_Objtype == "Land_stand_small_EP1") then 
{
    _obj setVariable["food",20,true];
};

if(_Objtype == "Fuel_can") then{
    _dc = random 100; 
    if(_dc < 50) then {
        _obj setVariable["fuel",false,true];
    } else { 
        _obj setVariable["fuel",true,true];
    };
};

if(_Objtype == "Can_small") then { 
    _obj setVariable  ["inUse",false,true];
    
};

_obj setpos [getpos _obj select 0,getpos _obj select 1,0];