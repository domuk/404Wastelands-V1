#define welcome_idc 3200
#define teamkill_info_idc 3500

class WelcomeMessage {
	idd = -1;
	duration = 1e+011;
	name= "WelcomeMessage";
	onLoad = "uiNamespace setVariable ['WelcomeMessage', _this select 0]";
	
	class controlsBackground {
		class WelcomeMessage_Text:w_RscText
		{
			idc = welcome_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.028;
			x = 0; y = 0;
			w = 1; h = 0.6;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			text = "Welcome";
		};
	};
};

class TeamkillMessage {
	idd = -1;
	duration = 1e+011;
	name= "TeamkillMessage";
	onLoad = "uiNamespace setVariable ['TeamkillMessage', _this select 0]";
	
	class controlsBackground {
		class TeamkillMessage_Text:w_RscText
		{
			idc = teamkill_info_idc;
			type = CT_STRUCTURED_TEXT;
			size = (safeZoneW / 45);
			x = (safeZoneX + (safeZoneW * 0.1)); y = (safeZoneY + (safeZoneH * 0.15));
			w = (safeZoneW * 0.8); h = (safeZoneH * 0.7);
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			text = "$STR_WL_TeamkillMessage";
			shadow = 2;
			class Attributes {
				align = "center";
			};
		};
	};
};