_isAdmin = serverCommandAvailable "#kick";

if (_isAdmin) then {
    player execVM "core\admin\adminMenu.sqf"; 
    hint "Welcome Admin";
    //isitadmin = true;
} else {
    sleep 1;
    //hint "You do not have permission to use the admin menu";
};