/*
	Tire Actions
	
	   by _neo_
*/
waituntil { !isNull (findDisplay 46) };

private ["_tire", "_unit", "_id"];
_tire = _this select 0;
_unit = _this select 1;
_id = _this select 2;

_tire setVariable ["NEO_tireFixDropActionId", _tire addAction ["Drop Tire", "scripts\NEO_tfs\TFS_act_drop.sqf", [], -1, true, true, "", 
"
	(!isNil { _target getVariable ""NEO_tireBeingDragged"" })
	&&
	!(animationState _this in [""AcinPknlMwlkSrasWrflDb"", ""AcinPknlMstpSrasWrflDnon""])
"]];
_unit setVariable ["NEO_disableinputTireDrag", (findDisplay 46) displayAddEventHandler ["KeyDown", "if (((_this select 1) in (ActionKeys ""stand""))||((_this select 1) in (ActionKeys ""crouch""))||((_this select 1) in (ActionKeys ""prone""))||((_this select 1) in (ActionKeys ""Salute""))||((_this select 1) in (ActionKeys ""sitDown""))||((_this select 1) in (ActionKeys ""Diary""))||((_this select 1) in (ActionKeys ""Surrender""))||((_this select 1) in (ActionKeys ""OpticsMode""))||((_this select 1) in (ActionKeys ""Binocular""))||((_this select 1) in (ActionKeys ""ReloadMagazine""))) then { true } else { false };"]];

private ["_fakeWeapon"];
_fakeWeapon = "";
if ((currentWeapon _unit != primaryWeapon _unit) || (currentWeapon _unit == "")) then
{
	if (primaryWeapon _unit != "") then
	{
		_unit selectWeapon (primaryWeapon _unit);
	}
	else
	{
		private ["_primaryWeapon"];
		_primaryWeapon = "M16_base";
		
		_unit addWeapon _primaryWeapon;
		_unit selectWeapon (primaryWeapon _unit);
		_fakeWeapon = _primaryWeapon;
	};
	
	[nil, _unit, rSWITCHMOVE, ""] call RE;
};

[nil, _unit, rSWITCHMOVE, "acinpknlmstpsraswrfldnon"] call RE;
_tire attachTo [_unit, [0,1,0.1], "HANDS"];
_tire setVariable ["NEO_tireBeingDragged", true, true];

waitUntil 
{ 
	(isNil { _tire getVariable "NEO_tireBeingDragged" }) 
	|| 
	(!alive _unit) 
	|| 
	((lifeState _unit) != "ALIVE") 
	|| 
	(
		(animationState _unit != "AcinPknlMwlkSrasWrflDb") 
		&& 
		(animationState _unit != "AcinPknlMstpSrasWrflDnon")
	)
};

if (_fakeWeapon != "") then { _unit removeWeapon _fakeWeapon };

detach _tire;

[nil, _unit, rSWITCHMOVE, ""] call RE;

if (!isNil { _tire getVariable "NEO_tireBeingDragged" }) then { _tire setVariable ["NEO_tireBeingDragged", nil, true] };
if (!isNil { _unit getVariable "NEO_disableinputTireDrag" }) then 
{ 
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", (_unit getVariable "NEO_disableinputTireDrag")];
	_unit setVariable ["NEO_disableinputTireDrag", nil];
};
if (!isNil { _tire getVariable "NEO_tireFixDropActionId" }) then
{
	_tire removeAction (_tire getVariable "NEO_tireFixDropActionId");
	_tire setVariable ["NEO_tireFixDropActionId", nil];
};
