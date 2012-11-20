_start = createDialog "AdminMenu";

#define AdminMenu 2119

thingsAvailable = [
"Player Menu",
"Vehicle Management"
];

{
	lbAdd [AdminMenu, _x];
} forEach thingsAvailable;