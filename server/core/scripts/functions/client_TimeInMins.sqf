//Time in Mins
if(!X_Server) exitWith {};
LocalTime = 0;

while {true} do {
   
   _dateTime = "Arma2Net.Unmanaged" callExtension "DateTime ['now', 'HH:mm:ss']";
	_timeArray = toArray _dateTime;
	_hour = parseNumber format["%1%2",toString [_timeArray select 1], toString [_timeArray select 2]];
	_min = parseNumber format["%1%2",toString [_timeArray select 4], toString [_timeArray select 5]];
	_timeInMins = (_hour * 60) + _min;
   
   LocalTime = _timeInMins;
   publicVariable "LocalTime";
   
    sleep 1; 
};