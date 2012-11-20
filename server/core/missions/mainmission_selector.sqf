if(!isServer) exitWith {};

//Main Mission Array
_MMarray = ["mission_MBT",
            "mission_LightTank",
            "mission_LightArmVeh",
            "mission_APC",
            "mission_Heli",
            "mission_WepCache",
            "mission_ReconVeh",
            "mission_AirWreck",
            "mission_FuelTruck",
            "mission_FuelTruck"];
            
_numb = count _MMarray;
_num = floor (random _numb);
_element = _MMarray select _num;

[1] execVM format ["server\core\missions\mainmissions\%1.sqf",_element];