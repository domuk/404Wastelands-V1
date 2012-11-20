#define teamkill_dialog 3300
#define teamkill_title 3301
#define teamkill_text 3302
#define teamkill_forgive 3303
#define teamkill_punish 3304

class TeamkillDialog {
	idd = teamkill_dialog;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class MainBG:w_RscPicture {
			idc = -1;
			text = "\ca\ui\data\ui_audio_background_ca.paa";
			moving = true;

			x = 0.25;
			y = 0.1;
			w = 0.5;
			h = 0.5 * (SafeZoneW / SafeZoneH);
		};

		class MainTitle:w_RscText {
			idc = teamkill_title;
			style = ST_CENTER;
			text = "";
			sizeEx = 0.04;
			shadow = 2;
			
			x = 0.26;
			y = 0.125;
			w = 0.46;
			h = 0.03;
		};		
		class TeamkillText:w_RscText {
			idc = teamkill_text;
			type = CT_STRUCTURED_TEXT+ST_LEFT;
			size = 0.032;
			shadow = 2;

			x = 0.26;
			y = 0.19;
			w = 0.46;
			h = 0.358;

			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "";
		};
	};
	
	class controls {
		class ForgiveButton:w_RscButton {
			idc = teamkill_forgive;
			text = "";
			onButtonClick = "false call client_teamkillAction";

			size = 0.031;
			
			x = 0.30; y = 0.585;
			w = 0.16; h = 0.065;
		};
		class PunishButton:w_RscButton {
			idc = teamkill_punish;
			text = "";
			onButtonClick = "true call client_teamkillAction";

			size = 0.031;
			color[] = {0.95, 0.15, 0.15, 1};
			
			x = 0.505; y = 0.585;
			w = 0.16; h = 0.065;
		};
	};

};