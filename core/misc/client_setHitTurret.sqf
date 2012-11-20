private ["_veh", "_hit", "_dam"];

_veh = _this select 0;
_hit = _this select 1;
_dam = _this select 2;
_veh setHit [getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "Turrets" >> "MainTurret" >> "HitPoints" >> (_hit) >> "name"), _dam];