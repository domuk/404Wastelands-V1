#include "rogue.sqf"

class rogueList {

	idd = rogue_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] execVM 'player_system\item_list.sqf'";
	
	class controlsBackground {
		
		class MainBG : w_RscPicture {
		
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			
			moving = true;
			
			x = 0.0; y = 0.1;
			w = 0.50; h = 0.50;
		
		};
		
		class MainTitle : w_RscText {
		
			idc = -1;
			text = "Rogue Players List";
			sizeEx = 0.03;
			
			x = 0.105; y = 0.106;
			w = 0.3; h = 0.05;
		
		};
		
		
	};
	
	class controls {
	
		class itemList : w_Rsclist {
		
		idc = rogue_field;
		//onLBSelChanged = "[0] execvm 'player_system\itemList.sqf'";
		
		x = 0.07; y = 0.16;
		w = 0.250; h = 0.365;
		
		};
		class CloseButton : w_RscButton {
			
			text = "Close";
			onButtonClick = "closeDialog 0;";
			
			x = 0.12; y = 0.54;
			w = 0.125; h = 0.05;
			
		};
		
	};

};