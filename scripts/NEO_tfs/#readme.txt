//=====================================================\\
Name: 				Tire Fix Script (TFS)
Current Version: 	1.01
Author:				_neo_
Credits: 			Tour members for testing and feedback
Last Edited: 		03/10/2011

//=====================================================\\

HOW DOES IT WORK?
- To wheeled vehicles can be added reserve tires to the cargo
- Switch tires between vehicles
- When a vehicle tire is not usable, drag a reserve tire and fix it

COMPATIBILITY:
- Full JIP support
- Single Player / Hosted Server / Dedicated Server
- A2 / A2 OA / A2 CO / BAF / PMC

SUPPORTED VEHICLES LIST (IN ALL VARIANTS):
- Jackal
- HMMWV
- LandRover
- SUV
- UAZ
- MTVR
- M1126
- M1128
- M1129
- M1130
- M1135
- BRDM2
- LAV25

//==========================================\\
				INSTALLATION
//==========================================\\
			***VERY IMPORTANT***

	PLACE THE FUNCTIONS MODULE ON EDITOR

/*
	//Init.sqf
	[] execVM "scripts\NEO_tfs\TFS_init.sqf";	//Needs to run on all machines
*/

			MAKE VEHICLE USE TFS
/*
	[(vehicle), (NUMBER tires in cargo (OPCIONAL)), (NUMBER max cargo capacity (OPCIONAL))] execVM "scripts\NEO_tfs\TFS_vehicle.sqf"; //Where vehicle is local
*/
==============================================

				CHANGELOGS
1.01
- Fixed: Units without primary weapon could not drag tires
- Added: Notes Added
- Added: Locked vehicles are now compatible
- Changed: Checking how many tires are in cargo, now also shows the maximum cargo capacity
- Changed: GUI size made smaller

1.00
- First public release
