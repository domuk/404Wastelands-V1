private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

//_uids = ["9109510", "11559174"];
//_uids2 = ["12604102", "4288512"];
//_names = ["BeTePoK", "MoveAlong", "Nagashi", "Clonk"];
_uids = ["18836358","20243782","32879878"];

if(_code == 41) then
{
	if(((getPlayerUID player) in _uids) || client_isDebug) then
	{
		createDialog "balca_debug_main";
	};
};

_handled

