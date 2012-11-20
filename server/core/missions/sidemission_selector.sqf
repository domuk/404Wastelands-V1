if(!isServer) exitWith {};

//Side Mission Array
_SMarray = ["mission_WepCache",
            "mission_ReconVeh",
            "mission_AirWreck",
            "mission_RepairTruck",
            "mission_FuelTruck",
            "mission_AmmoTruck"];
			
_numb = count _SMarray;
_num = floor (random _numb);
_element = _SMarray select _num;

[] execVM format ["server\core\missions\sidemissions\%1.sqf",_element];