//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////


sleep 60;


fn_findMissionSpot = {

	//creating the random position

	private ["_rad","_cnps","_hills","_hillcount","_hillnum","_hill","_marker","_boxes","_numb","_boxnum","_box"];

	_rad=20000;
	_cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_hills = nearestLocations [_cnps, ["FlatArea"], _rad];
	_hillcount = count _hills;
	_hillnum = floor (random _hillcount);
	_hill = _hills select _hillnum;

	getPos _hill
};


//Random Vehicles
	//Armour Spawning 1
	//creating the marker 

	_marker = createMarker ["Armour1", call fn_findMissionSpot];

	//creating the vehicle
	_veh = ["BAF_FV510_W","BRDM2_ATGM_INS","BRDM2_TK_EP1","M113_TK_EP1"] call BIS_fnc_selectRandom;
	art1 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	art1 setFuel random 1;
	art1 setVehicleAmmo random 1;
	
	//Armour Spawning 2
	//creating the marker 

	_marker = createMarker ["Armour2", call fn_findMissionSpot];

	//creating the vehicle
	_veh = ["M1126_ICV_MK19_EP1","BRDM2_ATGM_CDF","BRDM2_ATGM_INS","BTR90"] call BIS_fnc_selectRandom;
	art2 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	art2 setFuel random 1;
	art2 setVehicleAmmo random 1;
	
	//Armour Spawning 3
	//creating the marker 

	_marker = createMarker ["Armour3", call fn_findMissionSpot];

	//creating the vehicle
	_veh = ["M1126_ICV_MK19_EP1","BRDM2_ATGM_CDF","BRDM2_ATGM_INS","BTR90"] call BIS_fnc_selectRandom;
	art3 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	art3 setFuel random 1;
	art3 setVehicleAmmo random 1;
	
	//Armour Spawning 4
	//creating the marker 

	_marker = createMarker ["Armour4", call fn_findMissionSpot];

	//creating the vehicle
	_veh = ["BAF_FV510_W","BRDM2_ATGM_INS","BRDM2_TK_EP1","M113_TK_EP1"] call BIS_fnc_selectRandom;
	art4 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	art4 setFuel random 1;
	art4 setVehicleAmmo random 1;
	
	//Armour Spawning 5
	//creating the marker 

	_marker = createMarker ["Armour5", call fn_findMissionSpot];

	//creating the vehicle
	_veh = ["M1126_ICV_MK19_EP1","BRDM2_ATGM_CDF","BRDM2_ATGM_INS","BTR90"] call BIS_fnc_selectRandom;
	art5 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	art5 setFuel random 1;
	art5 setVehicleAmmo random 1;
	
	//Armour Spawning 6
	//creating the marker 

	_marker = createMarker ["Armour6", call fn_findMissionSpot];

	//creating the vehicle
	_veh = ["M1126_ICV_MK19_EP1","BRDM2_ATGM_CDF","BRDM2_ATGM_INS","BTR90"] call BIS_fnc_selectRandom;
	art6 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	art6 setFuel random 1;
	art6 setVehicleAmmo random 1;
	
	//Armour Spawning 7
	//creating the marker 

	_marker = createMarker ["Armour7", call fn_findMissionSpot];

	//creating the vehicle
	_veh = ["M1126_ICV_MK19_EP1","BRDM2_ATGM_CDF","BRDM2_ATGM_INS","BTR90"] call BIS_fnc_selectRandom;
	art7 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	art7 setFuel random 1;
	art7 setVehicleAmmo random 1;
	
	//Armour Spawning 8
	//creating the marker 

	_marker = createMarker ["Armour8", call fn_findMissionSpot];

	//creating the vehicle
	_veh = ["M1126_ICV_MK19_EP1","BRDM2_ATGM_CDF","BRDM2_ATGM_INS","BTR90"] call BIS_fnc_selectRandom;
	art8 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	art8 setFuel random 1;
	art8 setVehicleAmmo random 1;
	
	//Armour Spawning 9
	//creating the marker 

	_marker = createMarker ["Armour9", call fn_findMissionSpot];

	//creating the vehicle
	_veh = ["M1126_ICV_MK19_EP1","BRDM2_ATGM_CDF","BRDM2_ATGM_INS","BTR90"] call BIS_fnc_selectRandom;
	art9 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	art9 setFuel random 1;
	art9 setVehicleAmmo random 1;
	
	//Armour Spawning 10
	//creating the marker 

	_marker = createMarker ["Armour10", call fn_findMissionSpot];

	//creating the vehicle
	_veh = ["M1126_ICV_MK19_EP1","BRDM2_ATGM_CDF","BRDM2_ATGM_INS","BTR90"] call BIS_fnc_selectRandom;
	art10 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	art10 setFuel random 1;
	art10 setVehicleAmmo random 1;

	//Chopper 1
	//creating the marker 
		
	_marker = createMarker ["Chopper1", call fn_findMissionSpot];
	
	//creating the vehicle
	
	_veh = ["UH1H_TK_GUE_EP1","MH6J_EP1","AH6J_EP1","UH1H_TK_EP1"] call BIS_fnc_selectRandom;
	heli1 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	heli1 setFuel random 1;
	heli1 setVehicleAmmo random 1;

	// chopper2
	//creating the marker 
	
		
	_marker = createMarker ["Chopper2", call fn_findMissionSpot];

	//creating the vehicle
	
	_veh = ["UH1H_TK_GUE_EP1","MH6J_EP1","AH6J_EP1","UH1H_TK_EP1"] call BIS_fnc_selectRandom;
	heli2 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	heli2 setFuel random 1;
	heli2 setVehicleAmmo random 1;
	
	// chopper3
	//creating the marker 
	
		
	_marker = createMarker ["Chopper3", call fn_findMissionSpot];

	//creating the vehicle
	
	_veh = ["UH1H_TK_GUE_EP1","MH6J_EP1","UH1H_TK_EP1"] call BIS_fnc_selectRandom;
	heli3 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	heli3 setFuel random 1;
	heli3 setVehicleAmmo random 1;
	
	// chopper4
	//creating the marker 
	
		
	_marker = createMarker ["Chopper4", call fn_findMissionSpot];

	//creating the vehicle
	
	_veh = ["UH1H_TK_GUE_EP1","MH6J_EP1","UH1H_TK_EP1"] call BIS_fnc_selectRandom;
	heli4 = createVehicle [_veh,[(getMarkerpos _marker select 0) + 30, getMarkerpos _marker select 1,0],[], 0, "NONE"];
	heli4 setFuel random 1;
	heli4 setVehicleAmmo random 1;
	

sleep 30;
	TitleText["Heli & Armour Spawn Completed!","PLAIN DOWN"];


		