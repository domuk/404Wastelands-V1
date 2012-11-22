AdminSelect = lbCurSel 2119;

switch (AdminSelect) do
{
        case 0: //Player Menu
	{
    	execVM "core\admin\playerMenu.sqf";
	};
	case 1: //Vehicle Management
	{
    	execVM "core\admin\vehicleManagement.sqf";     
	};
        case 2: //Satellite
        {

        };
};