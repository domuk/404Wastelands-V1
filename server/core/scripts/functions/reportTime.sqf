if(!X_Server) exitWith {};
//Get local time
LocalTime = "";

while {true} do {
    _dateTime = "Arma2Net.Unmanaged" callExtension "DateTime ['now', 'HH:mm:ss']";
    _timeArray = toArray _dateTime;
    _hour = parseNumber format["%1%2",toString [_timeArray select 1], toString [_timeArray select 2]];
    _min = parseNumber format["%1%2",toString [_timeArray select 4], toString [_timeArray select 5]];
    _sec = parseNumber format["%1%2",toString [_timeArray select 7], toString [_timeArray select 8]];
    
    LocalTime = format["%1:%2:%3",_hour,_min,_sec];
    publicVariable "LocalTime";

sleep 1;
};