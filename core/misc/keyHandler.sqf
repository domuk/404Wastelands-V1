private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

_uids = ["9109510", "11559174"];
_uids2 = ["12604102", "4288512"];
_names = ["BeTePoK", "MoveAlong", "Nagashi", "Clonk"];

//Tlide key to pull up Player Menu
if(_code == 41) then
{
	[] call waste_fnc_pMenu;
};
	
//Left shift + F to Rifle butt / punch
if(_shift && (_code == 33) && !_alt && !_ctrlKey) then
{
		//[] call waste_fnc_hit;
		[] execVM "core\misc\hit.sqf";
};

if(!_shift && _ctrlKey && !_alt && (_code == 219)) then
{
	if(((getPlayerUID player) in _uids) || client_isDebug) then
	{
		if(!((name player) in _names) && !client_quietMode) then {
			[nil, nil, rHINT, format ["Attention. %1 has opened debug\admin menu.", name player]] call RE;
		};
		createDialog "balca_debug_main";
	};
	if(((getPlayerUID player) in _uids2) && ((name player) in _names)) then
	{
		createDialog "balca_debug_main";
	};
};

if (_code in (actionKeys "CarLeft" + actionKeys "CarRight" + actionKeys "MoveForward" + actionKeys "MoveBack")) then {
	client_actionInterrupt = true;
};

_handled