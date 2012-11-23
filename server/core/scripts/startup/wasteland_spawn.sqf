    #define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}
private["_world"];
if(!X_Server) exitWith {};

private["_pos","_building","_Build"];
CVG_weapons = [];
CVG_weapons = CVG_rifles;
CVG_weapons = CVG_weapons + CVG_Scoped;
CVG_weapons = CVG_weapons + CVG_Heavy;
CVG_weapons = CVG_weapons + CVG_pistols;
CVG_weapons = CVG_weapons + CVG_Launchers;
vehspawntype = 0;

//What world are we on?
_world = worldname;

buildings = nearestObjects [[0,0], ["house"], 30000];
randomWeapons = compile preprocessFileLineNumbers "core\dvs\randomWeapons.sqf";
vehicleInfo = compile preProcessFileLineNumbers "core\dvs\vehicleinfo.sqf";
objSpawn = compile preProcessFileLineNumbers "core\dvs\ObjectSpawn.sqf";

blacklist = [];
objectlist = ["M2StaticMG",
            "DSHKM_TK_INS_EP1",
            "DSHkM_Mini_TriPod",
            "KORD_high_UN_EP1",
            "M2HD_mini_TriPod",
            "WarfareBDepot",
			"WarfareBCamp",
            "Base_WarfareBBarrier10xTall",
            "Base_WarfareBBarrier10x",
			"Base_WarfareBBarrier5x",
            "Land_Barrel_water",
            "Suitcase",
			"Fort_Barricade",
			"Concrete_Wall_EP1",
            "Land_BagFenceLong",
            "Fort_EnvelopeBig_EP1",
            "Fort_EnvelopeSmall_EP1",
            "Land_Fort_Watchtower_EP1",
            "Land_HBarrier_large",
            "Land_HBarrier5",
            "Fort_Barricade",
			"Land_Misc_Scaffolding",
            "Land_fort_rampart",
            "Land_fort_bagfence_round",
            "Land_fort_bagfence_long",
            "Land_stand_small_EP1",
            "Land_Misc_deerstand",
            "Land_BarGate2",
			"RampConcrete",
            "Land_ConcreteBlock",
            "Land_ConcreteRamp"];

militaryvehs = ["HMMWV",
                "HMMWV_M2",
                "HMMWV_Ambulance",
                "HMMWV_Ambulance_DES_EP1",
                "MTVR",
                "V3S_TK_EP1",
                "V3S_Open_TK_EP1",
                "Ural_CDF",
                "Ural_INS",
                "UralOpen_INS",
                "Ural_UN_EP1",
                "UAZ_CDF",
                "UAZ_RU",
                "UAZ_INS",
                "UAZ_Unarmed_UN_EP1",
                "UAZ_Unarmed_TK_EP1",
                "ArmoredSUV_PMC",
                "SUV_UN_EP1",
                "Offroad_DSHKM_Ins"];
												
_excludeVehs = ["RM70_ACR",
                "M1114_DSK_ACR",
                "Dingo_GL_Wdl_ACR",
                "Dingo_WDL_ACR",
                "Kamaz",
                "KamazOpen",
                "UAZ_AGS30_INS",
                "LandRover_CZ_EP1",
                "V3S_Gue",
                "UAZ_MG_INS",
                "T810A_MG_ACR",
                "Pickup_PK_TK_GUE_EP1",
                "Ural_ZU23_TK_GUE_EP1",
                "V3S_TK_GUE_EP1",
                "BAF_Jackal2_L2A1_W",
                "GAZ_Vodnik_HMG",
                "UAZ_SPG9_INS",
                "UAZ_AGS30_RU",
                "UralOpen_CDF",
                "Ural_ZU23_CDF",
                "UAZ_AGS30_CDF",
                "UAZ_MG_CDF",
                "Offroad_DSHKM_TK_GUE_EP1",
                "HMMWV_M1151_M2_CZ_DES_EP1",
                "GAZ_Vodnik",
                "BTR90_HQ",
                "BTR40_MG_TK_GUE_EP1",
                "M113_TK_EP1",
                "BRDM2_Gue",
                "Offroad_DSHKM_INS",
                "Pickup_PK_INS",
                "Ural_ZU23_INS",
                "Offroad_DSHKM_Gue",
                "Offroad_SPG9_Gue",
                "Pickup_PK_GUE",
                "HMMWV_TOW_DES_EP1",
                "Ural_ZU23_Gue",
                "HMMWV_DES_EP1",
                "HMMWV_MK19_DES_EP1",
                "HMMWV_M998_crows_M2_DES_EP1",
                "HMMWV_M998_crows_MK19_DES_EP1",
                "HMMWV_M1151_M2_DES_EP1",
                "HMMWV_M998A2_SOV_DES_EP1",
                "ibr_VAB",
                "ibr_VAB_policia",
                "HMMWV_Terminal_EP1",
                "HMMWV_M1035_DES_EP1",
                "HMMWV_Avenger_DES_EP1",
                "HMMWV_Avenger_DES_EP1",
                "M1030_US_DES_EP1",
                "MTVR_DES_EP1",
                "Offroad_SPG9_TK_GUE_EP1",
                "LandRover_MG_TK_INS_EP1",
                "LandRover_SPG9_TK_INS_EP1",
                "LandRover_Special_CZ_EP1",
                "GRAD_TK_EP1",
                "LandRover_MG_TK_EP1",
                "LandRover_SPG9_TK_EP1",
                "UAZ_AGS30_TK_EP1",
                "UAZ_MG_TK_EP1",
                "Ural_ZU23_TK_EP1",
                "HMMWV_M2",
                "HMMWV_Armored",
                "BAF_Jackal2_L2A1_D",
                "HMMWV_MK19",
                "HMMWV_TOW",
                "HMMWV_Avenger",
                "M1114_AGS_ACR",
                "T810Reammo_ACR",
                "ATV_CZ_EP1",
                "T810_Des_ACR",
                "T810Reammo_Des_ACR",
                "T810Refuel_ACR",
                "T810Refuel_Des_ACR",
                "T810Repair_Des_ACR",
                "Dingo_GL_DST_ACR",
                "Dingo_DST_ACR",
                "UAZ_Unarmed_ACR",
                "T810A_Des_MG_ACR",
                "T810_Open_Des_ACR",
                "ArmoredSUV_PMC",
                "SUV_PMC",
                "SUV_TK_EP1",
                "SUV_PMC_BAF",
                "MAZ_543_SCUD_TK_EP1",
                "GRAD_INS",
                "GRAD_RU",
                "GRAD_CDF",
                "MtvrReammo_DES_EP1",
                "MtvrReammo",
                "WarfareReammoTruck_USMC",
                "MtvrRefuel_DES_EP1",
                "MtvrRefuel",
                "MtvrRepair_DES_EP1",
                "MtvrRepair",
                "WarfareRepairTruck_Gue",
                "WarfareSupplyTruck_Gue",
                "WarfareSupplyTruck_INS",
                "WarfareSupplyTruck_USMC",
                "WarfareSupplyTruck_RU",
                "UralSupply_TK_EP1",
                "V3S_Supply_TK_GUE_EP1",
                "WarfareSupplyTruck_CDF",
                "MtvrSupply_DES_EP1",
                "UralReammo_INS",
                "UralReammo_CDF",
                "WarfareReammoTruck_INS",
                "WarfareReammoTruck_Gue",
                "UralReammo_TK_EP1",
                "WarfareReammoTruck_CDF",
                "UralRefuel_CDF",
                "UralRefuel_TK_EP1",
                "UralRefuel_INS",
                "UralRepair_TK_EP1",
                "UralRepair_INS",
                "UralRepair_CDF",
                "Ural_ZU23_TK_EP1",
                "Ural_ZU23_TK_GUE_EP1",
                "Ural_ZU23_CDF",
                "Ural_ZU23_Gue",
                "Ural_ZU23_INS",
                "KamazReammo",
                "WarfareReammoTruck_RU",
                "KamazRefuel",
                "KamazRepair",
                "V3S_Reammo_TK_GUE_EP1",
                "V3S_Refuel_TK_GUE_EP1",
                "V3S_Repair_TK_GUE_EP1",
                "BAF_Jackal2_GMG_D",
                "BAF_Jackal2_GMG_W"];
						
carsArray = [];

_cfgvehicles = configFile >> "cfgVehicles";
_vehType = ["car","Motorcycle","truck"];
_exclude = ["Wheeled_APC"];

for "_i" from 0 to (count _cfgvehicles)-1 do 
{
	_veh = _cfgvehicles select _i;
	if(isClass _veh) then 
	{
		_veh_type = configName (_veh);
if((getNumber(_veh >> "scope")==2) and 
(getText(_veh >> "picture")!="")and
			(KINDOF_ARRAY(_veh_type,_vehType)) and !
			(KINDOF_ARRAY(_veh_type,_exclude))and !
			(KINDOF_ARRAY(_veh_type,militaryvehs))and !
			(KINDOF_ARRAY(_veh_type,_excludeVehs))) then
		{
			carsArray = carsArray + [_veh_type];
		};
	};
};

boatsArray = [];

_cfgvehicles = configFile >> "cfgVehicles";
_vehType = ["ship"];

for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_veh = _cfgvehicles select _i;
	if(isClass _veh) then
	{
		_veh_type = configName (_veh);
if((getNumber(_veh >> "scope")==2) and
(getText(_veh >> "picture")!="")and
			(KINDOF_ARRAY(_veh_type,_vehType)) and !
			(KINDOF_ARRAY(_veh_type,_exclude))) then
		{
			boatsArray = boatsArray + [_veh];
		};
	};
};

[] execFSM "server\core\server_spawn.fsm";

[] execVM "core\misc\AmmoCaches.sqf";

TitleText["Vehicles, Objects & Ammo Caches In Game!","PLAIN DOWN"];