/*
     TFS_fnc_relPos.sqf

	- Fix relPos
	
	   by _neo_
*/
private ["_target", "_selection", "_pos", "_dir"];
_target = _this select 0;
_selection = _this select 2;
_pos = [];
_dir = 0;

//Which tire is damage
switch (_selection) do
{
	//Front Left Wheel
	case "wheel_1_1_steering" :
	{
		switch (true) do
		{
			case (_target isKindOf "HMMWV_Base") :
			{
				_pos = ([_target, 2.5, ((getDir _target) - 45)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 45);
			};
			case (_target isKindOf "LandRover_Base") :
			{
				_pos = ([_target, 2.5, ((getDir _target) - 45)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 60);
			};
			case (_target isKindOf "SUV_Base_EP1") :
			{
				_pos = ([_target, 2.25, ((getDir _target) - 60)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 60);
			};
			case (_target isKindOf "UAZ_Base") :
			{
				_pos = ([_target, 2.1, ((getDir _target) - 50)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 45);
			};
			case ((_target isKindOf "BAF_Jackal2_GMG_D") || (_target isKindOf "BAF_Jackal2_L2A1_D") || (_target isKindOf "BAF_Jackal2_GMG_W") || (_target isKindOf "BAF_Jackal2_L2A1_W")) :
			{
				_pos = ([_target, 2.5, ((getDir _target) - 45)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 45);
			};
			case (_target isKindOf "MTVR") :
			{
				_pos = ([_target, 3.75, ((getDir _target) - 30)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 60);
			};
			case ((_target isKindOf "M1126_ICV_mk19_EP1") || (_target isKindOf "M1126_ICV_M2_EP1") || (_target isKindOf "M1128_MGS_EP1") || (_target isKindOf "M1129_MC_EP1") || (_target isKindOf "M1130_CV_EP1") || (_target isKindOf "M1135_ATGMV_EP1")) :
			{
				_pos = ([_target, 3.5, ((getDir _target) - 55)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 45);
			};
			case ((_target isKindOf "BRDM2_ATGM_CDF") || (_target isKindOf "BRDM2_CDF") || (_target isKindOf "BRDM2_Gue") || (_target isKindOf "BRDM2_HQ_Gue") || (_target isKindOf "BRDM2_ATGM_INS") || (_target isKindOf "BRDM2_INS") || (_target isKindOf "BRDM2_ATGM_TK_EP1") || (_target isKindOf "BRDM2_TK_EP1") || (_target isKindOf "BRDM2_HQ_TK_GUE_EP1") || (_target isKindOf "BRDM2_TK_GUE_EP1")) :
			{
				_pos = ([_target, 2.5, ((getDir _target) - 55)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 45);
			};
			case ((_target isKindOf "LAV25") || (_target isKindOf "LAV25_HQ")) :
			{
				_pos = ([_target, 2.75, ((getDir _target) - 45)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 45);
			};
		};
	};
	//Back Left Wheel
	case "wheel_1_2_steering" :
	{
		switch (true) do
		{
			case (_target isKindOf "HMMWV_Base") :
			{
				_pos = ([_target, 2.5, ((getDir _target) - 130)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 30);
			};
			case (_target isKindOf "LandRover_Base") :
			{
				_pos = ([_target, 2.25, ((getDir _target) - 115)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 30);
			};
			case (_target isKindOf "SUV_Base_EP1") :
			{
				_pos = ([_target, 2.6, ((getDir _target) - 135)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 45);
			};
			case (_target isKindOf "UAZ_Base") :
			{
				_pos = ([_target, 1.8, ((getDir _target) - 110)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 35);
			};
			case ((_target isKindOf "BAF_Jackal2_GMG_D") || (_target isKindOf "BAF_Jackal2_L2A1_D") || (_target isKindOf "BAF_Jackal2_GMG_W") || (_target isKindOf "BAF_Jackal2_L2A1_W")) :
			{
				_pos = ([_target, 2.5, ((getDir _target) - 125)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 25);
			};
			case (_target isKindOf "MTVR") :
			{
				_pos = ([_target, 2, ((getDir _target) - 105)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 15);
			};
			case ((_target isKindOf "M1126_ICV_mk19_EP1") || (_target isKindOf "M1126_ICV_M2_EP1") || (_target isKindOf "M1128_MGS_EP1") || (_target isKindOf "M1129_MC_EP1") || (_target isKindOf "M1130_CV_EP1") || (_target isKindOf "M1135_ATGMV_EP1")) :
			{
				_pos = ([_target, 3, ((getDir _target) - 75)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 15);
			};
			case ((_target isKindOf "BRDM2_ATGM_CDF") || (_target isKindOf "BRDM2_CDF") || (_target isKindOf "BRDM2_Gue") || (_target isKindOf "BRDM2_HQ_Gue") || (_target isKindOf "BRDM2_ATGM_INS") || (_target isKindOf "BRDM2_INS") || (_target isKindOf "BRDM2_ATGM_TK_EP1") || (_target isKindOf "BRDM2_TK_EP1") || (_target isKindOf "BRDM2_HQ_TK_GUE_EP1") || (_target isKindOf "BRDM2_TK_GUE_EP1")) :
			{
				_pos = ([_target, 2.5, ((getDir _target) - 125)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 25);
			};
			case ((_target isKindOf "LAV25") || (_target isKindOf "LAV25_HQ")) :
			{
				_pos = ([_target, 2.25, ((getDir _target) - 65)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 15);
			};
		};
	};
	//Front Right Wheel
	case "wheel_2_1_steering" :
	{ 	
		switch (true) do
		{
			case (_target isKindOf "HMMWV_Base") :
			{
				_pos = ([_target, 2.5, ((getDir _target) + 45)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 45);
			};
			case (_target isKindOf "LandRover_Base") :
			{
				_pos = ([_target, 2.5, ((getDir _target) + 45)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 50);
			};
			case (_target isKindOf "SUV_Base_EP1") :
			{
				_pos = ([_target, 2.1, ((getDir _target) + 60)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 35);
			};
			case (_target isKindOf "UAZ_Base") :
			{
				_pos = ([_target, 2.1, ((getDir _target) + 50)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 30);
			};
			case ((_target isKindOf "BAF_Jackal2_GMG_D") || (_target isKindOf "BAF_Jackal2_L2A1_D") || (_target isKindOf "BAF_Jackal2_GMG_W") || (_target isKindOf "BAF_Jackal2_L2A1_W")) :
			{
				_pos = ([_target, 2.25, ((getDir _target) + 50)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 30);
			};
			case (_target isKindOf "MTVR") :
			{
				_pos = ([_target, 3.75, ((getDir _target) + 30)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 60);
			};
			case ((_target isKindOf "M1126_ICV_mk19_EP1") || (_target isKindOf "M1126_ICV_M2_EP1") || (_target isKindOf "M1128_MGS_EP1") || (_target isKindOf "M1129_MC_EP1") || (_target isKindOf "M1130_CV_EP1") || (_target isKindOf "M1135_ATGMV_EP1")) :
			{
				_pos = ([_target, 3.5, ((getDir _target) + 55)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 45);
			};
			case ((_target isKindOf "BRDM2_ATGM_CDF") || (_target isKindOf "BRDM2_CDF") || (_target isKindOf "BRDM2_Gue") || (_target isKindOf "BRDM2_HQ_Gue") || (_target isKindOf "BRDM2_ATGM_INS") || (_target isKindOf "BRDM2_INS") || (_target isKindOf "BRDM2_ATGM_TK_EP1") || (_target isKindOf "BRDM2_TK_EP1") || (_target isKindOf "BRDM2_HQ_TK_GUE_EP1") || (_target isKindOf "BRDM2_TK_GUE_EP1")) :
			{
				_pos = ([_target, 2.5, ((getDir _target) + 50)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 30);
			};
			case ((_target isKindOf "LAV25") || (_target isKindOf "LAV25_HQ")) :
			{
				_pos = ([_target, 3, ((getDir _target) + 55)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 35);
			};
		};
	};
	//Back Right Wheel
	case "wheel_2_2_steering" :
	{
		switch (true) do
		{
			case (_target isKindOf "HMMWV_Base") :
			{
				_pos = ([_target, 2.5, ((getDir _target) + 130)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 30);
			};
			case (_target isKindOf "LandRover_Base") :
			{
				_pos = ([_target, 2.15, ((getDir _target) + 120)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 30);
			};
			case (_target isKindOf "SUV_Base_EP1") :
			{
				_pos = ([_target, 2.7, ((getDir _target) + 140)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 55);
			};
			case (_target isKindOf "UAZ_Base") :
			{
				_pos = ([_target, 2, ((getDir _target) + 130)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 35);
			};
			case ((_target isKindOf "BAF_Jackal2_GMG_D") || (_target isKindOf "BAF_Jackal2_L2A1_D") || (_target isKindOf "BAF_Jackal2_GMG_W") || (_target isKindOf "BAF_Jackal2_L2A1_W")) :
			{
				_pos = ([_target, 2.25, ((getDir _target) + 135)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 45);
			};
			case (_target isKindOf "MTVR") :
			{
				_pos = ([_target, 2, ((getDir _target) + 105)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 15);
			};
			case ((_target isKindOf "M1126_ICV_mk19_EP1") || (_target isKindOf "M1126_ICV_M2_EP1") || (_target isKindOf "M1128_MGS_EP1") || (_target isKindOf "M1129_MC_EP1") || (_target isKindOf "M1130_CV_EP1") || (_target isKindOf "M1135_ATGMV_EP1")) :
			{
				_pos = ([_target, 2.85, ((getDir _target) + 75)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 15);
			};
			case ((_target isKindOf "BRDM2_ATGM_CDF") || (_target isKindOf "BRDM2_CDF") || (_target isKindOf "BRDM2_Gue") || (_target isKindOf "BRDM2_HQ_Gue") || (_target isKindOf "BRDM2_ATGM_INS") || (_target isKindOf "BRDM2_INS") || (_target isKindOf "BRDM2_ATGM_TK_EP1") || (_target isKindOf "BRDM2_TK_EP1") || (_target isKindOf "BRDM2_HQ_TK_GUE_EP1") || (_target isKindOf "BRDM2_TK_GUE_EP1")) :
			{
				_pos = ([_target, 2.5, ((getDir _target) + 125)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 45);
			};
			case ((_target isKindOf "LAV25") || (_target isKindOf "LAV25_HQ")) :
			{
				_pos = ([_target, 2.5, ((getDir _target) + 75)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 15);
			};
		};
	};

	//Vehicles with 6 wheels
	case "wheel_1_3_steering" :
	{
		switch (true) do
		{
			case (_target isKindOf "MTVR") :
			{
				_pos = ([_target, 2.75, ((getDir _target) - 140)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 50);
			};
			case ((_target isKindOf "M1126_ICV_mk19_EP1") || (_target isKindOf "M1126_ICV_M2_EP1") || (_target isKindOf "M1128_MGS_EP1") || (_target isKindOf "M1129_MC_EP1") || (_target isKindOf "M1130_CV_EP1") || (_target isKindOf "M1135_ATGMV_EP1")) :
			{
				_pos = ([_target, 2.5, ((getDir _target) - 100)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 5);
			};
			case ((_target isKindOf "LAV25") || (_target isKindOf "LAV25_HQ")) :
			{
				_pos = ([_target, 2, ((getDir _target) - 100)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 5);
			};
		};
	};
	case "wheel_2_3_steering" :
	{ 	
		switch (true) do
		{
			case (_target isKindOf "MTVR") :
			{
				_pos = ([_target, 2.75, ((getDir _target) + 140)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 50);
			};
			case ((_target isKindOf "M1126_ICV_mk19_EP1") || (_target isKindOf "M1126_ICV_M2_EP1") || (_target isKindOf "M1128_MGS_EP1") || (_target isKindOf "M1129_MC_EP1") || (_target isKindOf "M1130_CV_EP1") || (_target isKindOf "M1135_ATGMV_EP1")) :
			{
				_pos = ([_target, 2.75, ((getDir _target) + 100)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 5);
			};
			case ((_target isKindOf "LAV25") || (_target isKindOf "LAV25_HQ")) :
			{
				_pos = ([_target, 2.5, ((getDir _target) + 100)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 25);
			};
		};
	};
	
	//Vehicles with 8 wheels
	case "wheel_1_4_steering" :
	{
		switch (true) do
		{
			case ((_target isKindOf "M1126_ICV_mk19_EP1") || (_target isKindOf "M1126_ICV_M2_EP1") || (_target isKindOf "M1128_MGS_EP1") || (_target isKindOf "M1129_MC_EP1") || (_target isKindOf "M1130_CV_EP1") || (_target isKindOf "M1135_ATGMV_EP1")) :
			{
				_pos = ([_target, 3, ((getDir _target) - 120)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 25);
			};
			case ((_target isKindOf "LAV25") || (_target isKindOf "LAV25_HQ")) :
			{
				_pos = ([_target, 2.5, ((getDir _target) - 130)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) + 35);
			};
		};
	};
	case "wheel_2_4_steering" :
	{
		switch (true) do
		{
			case ((_target isKindOf "M1126_ICV_mk19_EP1") || (_target isKindOf "M1126_ICV_M2_EP1") || (_target isKindOf "M1128_MGS_EP1") || (_target isKindOf "M1129_MC_EP1") || (_target isKindOf "M1130_CV_EP1") || (_target isKindOf "M1135_ATGMV_EP1")) :
			{
				_pos = ([_target, 3, ((getDir _target) + 120)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 45);
			};
			case ((_target isKindOf "LAV25") || (_target isKindOf "LAV25_HQ")) :
			{
				_pos = ([_target, 3, ((getDir _target) + 122.5)] call BIS_fnc_relPos);
				_dir = (([_pos, _target] call BIS_fnc_dirTo) - 35);
			};
		};
	};
};

//Return
[_pos, _dir];
