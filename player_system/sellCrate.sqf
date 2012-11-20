_crate = _this;

private ["_weapons", "_magazines", "_lines", "_message", "_profit", "_price"];

_profit = 0;
_lines = 0;

_message = "<t size=""1.5"">Sell summary</t><br/><br/>";
if(!(_crate isKindOf "WeaponHolder")) then {
	_message = format["%1<t align=""left""><t color=""#ccccff"">x1</t> %2</t><t align=""right"" color=""#aaffaa"">$50</t><br/>", _message, typeOf _crate];
	_profit = 50;
};

_weapons = getWeaponCargo _crate;
if(count(_weapons select 0) > 0) then {
	_message = format["%1-------------- Weapons --------------<br/>", _message];
	for "_i" from 0 to (count(_weapons select 0) - 1) do {
		_price = 0;
		{if((_weapons select 0 select _i) == _x select 0) then {
			_price = _x select 1;
		};} forEach publicVar_shopSellWeapons;
		if(_price != 0) then {
			_profit = _profit + ((_weapons select 1 select _i) * _price);
			if(_lines < 12) then {
				_message = format["%1<t align=""left""><t color=""#ccccff"">x%2</t> %3</t><t align=""right"" color=""#aaffaa"">$%4</t><br/>", _message, (_weapons select 1 select _i), (_weapons select 0 select _i), ((_weapons select 1 select _i) * _price)];
				_lines = _lines + 1;
			} else {
				if(_lines == 12) then {
					_message = format ["%1... and more<br/>", _message];
					_lines = _lines + 1;
				};
			};
		};
	};
};

_magazines = getMagazineCargo _crate;
if(count(_magazines select 0) > 0) then {
	_message = format["%1------------- Magazines -------------<br/>", _message];
	for "_i" from 0 to (count(_magazines select 0) - 1) do {
		_price = 5;
		{if((_magazines select 0 select _i) == _x select 0) then {
			_price = _x select 1;
		};} forEach publicVar_shopSellMagazines;
		if(_price != 0) then {
			_profit = _profit + ((_magazines select 1 select _i) * _price);
			if(_lines < 12) then {
				_message = format["%1<t align=""left""><t color=""#ccccff"">x%2</t> %3</t><t align=""right"" color=""#aaffaa"">$%4</t><br/>", _message, (_magazines select 1 select _i), (_magazines select 0 select _i), ((_magazines select 1 select _i) * _price)];
				_lines = _lines + 1;
			} else {
				if(_lines == 12) then {
					_message = format ["%1...and more<br/>", _message];
					_lines = _lines + 2;
				};
				if(_lines == 13) then {
					_message = format ["%1...<br/>", _message];
					_lines = _lines + 1;
				};
			};
		};
	};
};

_message = format["%1<br/>---------------- Total ----------------<br/>", _message];
_message = format["%1<t size=""2"" color=""#aaffaa"">$%2</t>", _message, _profit];

deleteVehicle _crate;
player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _profit, true];

hint parseText _message;