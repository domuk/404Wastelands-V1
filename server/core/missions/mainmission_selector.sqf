if(!isServer) exitWith {};

diag_log format["WASTELAND SERVER - Started Mission Selector"];

//Main Mission Array
_MMarray = ["mission_MBT",
            "mission_LightTank",
            "mission_LightArmVeh",
            "mission_APC",
            "mission_Heli",
            "mission_WepCache",
            "mission_ReconVeh",
            "mission_AirWreck",
            "mission_Truck",
            "mission_Truck"];
            
_numb = count _MMarray;
_num = floor (random _numb);
_element = _MMarray select _num;

diag_log format["WASTELAND SERVER - Execute First Mission"];
execVM format ["server\core\missions\mainmissions\%1.sqf", _element];