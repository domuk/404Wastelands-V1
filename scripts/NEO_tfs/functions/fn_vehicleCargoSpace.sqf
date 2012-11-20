/*
TFS_fnc_vehicleCargoSpace.sqf

- Maximum number of tires
	
	   by _neo_
*/
private ["_veh", "_result"];
_veh = _this select 0;
_result = switch (true) do
{
	case ((_veh isKindOf "BAF_Jackal2_GMG_D")||(_veh isKindOf "BAF_Jackal2_L2A1_D")||(_veh isKindOf "BAF_Jackal2_GMG_W")||(_veh isKindOf "BAF_Jackal2_L2A1_W")||(_veh isKindOf "HMMWV_Base")||(_veh isKindOf "SUV_Base_EP1")||(_veh isKindOf "UAZ_Base")) : { 3 };
	case (_veh isKindOf "LandRover_Base") : { 4 };
	case (_veh isKindOf "MTVR") : { 6 };
	case DEFAULT { 5 };
};

_result;
