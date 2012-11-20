
private ["_marker","_boxes","_town","_newpos","_numb","_boxnum","_box","_townpos","_towns"];

if (isServer) then 
{
    if (CVG_Caches == 1) then 
    {
        boxes = 100;	// Starting point every island should have...
        _towns = towns;
        
        while {boxes > 0} do 
        {
            _boxes = ["USBasicWeaponsBox","RUBasicWeaponsBox","GERBasicWeapons_EP1","USBasicWeapons_EP1","TKBasicWeapons_EP1","SpecialWeaponsBox","Ammobox_PMC"];
            _town = _towns call BIS_fnc_selectRandom;
            _newpos = getpos _town;
            _townpos = [_newpos, 10, 100, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
            _numb = (count _boxes);
            _boxnum = floor (random _numb);
            _box = _boxes select _boxnum;
            _box = createVehicle [_box,_townpos,[], 0, "NONE"]; 
            boxes = boxes - 1;
        };
    };
};