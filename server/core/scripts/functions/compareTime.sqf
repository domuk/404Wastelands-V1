//Compare time

private["_currTime","_startTime","_duration","_result","_return"];

_currTime = _this select 0;
_startTime = _this select 1;
_duration = _this select 2;
_result = 0;

if(_startTime > 20) then
{
    switch (_currTime) do {
        case 0:{_currTime = 1440;};
        case 1:{_currTime = 1441;};
        case 2:{_currTime = 1442;};
        case 3:{_currTime = 1443;};
        case 4:{_currTime = 1444;};
        case 5:{_currTime = 1445;};
        case 6:{_currTime = 1446;};
        case 7:{_currTime = 1447;};
        case 8:{_currTime = 1448;};
        case 9:{_currTime = 1449;};
        case 10:{_currTime = 1450;};
        case 11:{_currTime = 1451;};
        case 12:{_currTime = 1452;};
        case 13:{_currTime = 1453;};
        case 14:{_currTime = 1454;};
        case 15:{_currTime = 1455;};
        case 16:{_currTime = 1456;};
        case 17:{_currTime = 1457;};
        case 18:{_currTime = 1458;};
        case 19:{_currTime = 1459;};
        case 20:{_currTime = 1460;};
        default	{};
    };
};

if(_currTime >= (_startTime + _duration)) then {_result = 1};

_return = _result;
_return;

