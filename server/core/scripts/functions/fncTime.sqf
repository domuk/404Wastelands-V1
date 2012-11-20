/*
	@file Version: 1a
	@file name: core\server\scripts\functions\fncTime.sqf
	@file Author: Deadbeat
	@file edit: 30/10/2012
	@file description: Return Current Server Time
*/
if(!isServer) exitwith {};

private["_time","_val","_return","_rand","_bool","_tar"];

_time = time;

hint "Hello World!";
sleep 5;

hint format["Time = %1", _time];
sleep 10;

_return;

/*
_tar = _this select 0;
_val = _this select 1;

_rand  = round(random _tar);
_bool = true;

while {_bool} do
{
	if(_rand < _val) then {_rand  = round(random _tar);} else {_bool = false;};
};

_return = _rand;
_return;
*/

