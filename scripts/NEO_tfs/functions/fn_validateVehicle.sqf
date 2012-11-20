/*
   TFS_fnc_validate.sqf

- Validate vehicle (check if its supported)
	
	   by _neo_
*/
private ["_target", "_valid"];
_target = _this select 0;
_valid = false;

if
(
	(_target isKindOf "BAF_Jackal2_GMG_D")
	||
	(_target isKindOf "BAF_Jackal2_L2A1_D")
	||
	(_target isKindOf "BAF_Jackal2_GMG_W")
	||
	(_target isKindOf "BAF_Jackal2_L2A1_W")
	||
	(_target isKindOf "HMMWV_Base")
	||
	(_target isKindOf "LandRover_Base")
	||
	(_target isKindOf "SUV_Base_EP1")
	||
	(_target isKindOf "UAZ_Base")
	||
	(_target isKindOf "MTVR")
	||
	(_target isKindOf "M1126_ICV_mk19_EP1")
	||
	(_target isKindOf "M1126_ICV_M2_EP1")
	||
	(_target isKindOf "M1128_MGS_EP1")
	||
	(_target isKindOf "M1129_MC_EP1")
	||
	(_target isKindOf "M1130_CV_EP1")
	||
	(_target isKindOf "M1135_ATGMV_EP1")
	||
	(_target isKindOf "BRDM2_Base")
	||
	(_target isKindOf "BRDM2_HQ_Base")
	||
	(_target isKindOf "BRDM2_ATGM_CDF")
	||
	(_target isKindOf "BRDM2_CDF")
	||
	(_target isKindOf "BRDM2_Gue")
	||
	(_target isKindOf "BRDM2_HQ_Gue")
	||
	(_target isKindOf "BRDM2_ATGM_INS")
	||
	(_target isKindOf "BRDM2_INS")
	||
	(_target isKindOf "BRDM2_ATGM_TK_EP1")
	||
	(_target isKindOf "BRDM2_TK_EP1")
	||
	(_target isKindOf "BRDM2_HQ_TK_GUE_EP1")
	||
	(_target isKindOf "BRDM2_TK_GUE_EP1")
	||
	(_target isKindOf "LAV25")
	||
	(_target isKindOf "LAV25_HQ")
)
then
{
	_valid = true;
};

_valid;
