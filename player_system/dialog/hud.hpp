#define hud_status_idc 3600
#define hud_vehicle_idc 3601

class WastelandHud {
	idd = -1;
        fadeout=0;
        fadein=0;
	duration = 20;
	name= "WastelandHud";
	onLoad = "uiNamespace setVariable ['WastelandHud', _this select 0]";
	
	class controlsBackground {
		class WastelandHud_Vehicle:w_RscText
		{
			idc = hud_vehicle_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.022;
			x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW))); y = safeZoneY + (safeZoneH * (1 - (0.56 / SafeZoneH)));
			//x = 0; y = 0;
			w = 0.4; h = 0.4;
			colorText[] = {1,1,1,1};
			lineSpacing = 2;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
		class WastelandHud_Status:w_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.16 / SafeZoneW))); y = safeZoneY + (safeZoneH * (1 - (0.20 / SafeZoneH)));
			//x = 0; y = 0;
			w = 0.14; h = 0.20;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "100 <img size='0.8' image='player_system\icons\f.paa'/><br/>100 <img size='0.8' image='player_system\icons\w.paa'/><br/>200 <img size='0.8' image='\CA\misc\data\icons\picture_money_CA.paa'/>";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
	};
};
