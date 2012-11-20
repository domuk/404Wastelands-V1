/*
   TFS_fnc_takeTirePos.sqf

- Take tire from vehicle relPos
	
	   by _neo_
*/
private ["_vehicle", "_dist", "_pos"];
_vehicle = _this select 0;
_dist = 0;
_pos = [];

switch (true) do
{
	case ((_vehicle isKindOf "HMMWV_Base") || (_vehicle isKindOf "BAF_Jackal2_GMG_D") || (_vehicle isKindOf "BAF_Jackal2_L2A1_D") || (_vehicle isKindOf "BAF_Jackal2_GMG_W") || (_vehicle isKindOf "BAF_Jackal2_L2A1_W") || (_vehicle isKindOf "LandRover_Base") || (_vehicle isKindOf "UAZ_Base")) : { _dist = 3.75 };
	case ((_vehicle isKindOf "SUV_Base_EP1")) : { _dist = 4.5 };
	case ((_vehicle isKindOf "MTVR")) : { _dist = 5.5 };
	case ((_vehicle isKindOf "BRDM2_TK_EP1") || (_vehicle isKindOf "BRDM2_HQ_TK_GUE_EP1") || (_vehicle isKindOf "BRDM2_TK_GUE_EP1") || (_vehicle isKindOf "BRDM2_Base") || (_vehicle isKindOf "BRDM2_HQ_Base") || (_vehicle isKindOf "BRDM2_ATGM_CDF") || (_vehicle isKindOf "BRDM2_Gue") || (_vehicle isKindOf "BRDM2_ATGM_INS") || (_vehicle isKindOf "BRDM2_INS")) : { _dist = 4.1 };
	case ((_vehicle isKindOf "LAV25") || (_vehicle isKindOf "LAV25_HQ") || (_vehicle isKindOf "M1126_ICV_mk19_EP1") || (_vehicle isKindOf "M1126_ICV_M2_EP1") || (_vehicle isKindOf "M1128_MGS_EP1") || (_vehicle isKindOf "M1129_MC_EP1") || (_vehicle isKindOf "M1130_CV_EP1") || (_vehicle isKindOf "M1135_ATGMV_EP1")) : { _dist = 4.3 };
};

_pos = [getPosATL _vehicle, _dist, ((getDir _vehicle) + 180)] call BIS_fnc_relPos;

_pos;
