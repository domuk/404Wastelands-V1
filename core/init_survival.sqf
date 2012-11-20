[] spawn  {
	while{true} do
	{
		sleep 600;
		waitUntil {!client_respawnDialogActive};
		if(hungerLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have starved to death.";}
		else
		{
		hungerLevel = hungerLevel - 10;
		if(hungerLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have starved to death.";};
		switch(true) do {
			case (hungerLevel <= 10 && hungerLevel >= 5): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now starving to death, you will slowly lose health, find something to eat quickly!", hungerLevel];};
			case (hungerLevel <= 20 && hungerLevel >= 15): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are starting to starve, you need to find something to eat otherwise you will start to lose health!", hungerLevel];};
			case (hungerLevel <= 30 && hungerLevel >= 25): {hint format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", hungerLevel];};
			case (hungerLevel <= 50 && hungerLevel >= 45): {hint format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", hungerLevel];};
			};
		};
	};
};

[] spawn  {
	while{true} do
	{
	sleep 450;
	waitUntil {!client_respawnDialogActive};
	if(thirstLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died from dehydration.";}
	else
	{
		thirstLevel = thirstLevel - 10;
		if(thirstLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died from dehydration.";};
		switch(true) do {
			case (thirstLevel <= 10 && thirstLevel >= 5): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now suffering from severe dehydration find something to drink quickly!", thirstLevel];};
			case (thirstLevel <= 20 && thirstLevel >= 15): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You haven't drank anything in along time, you should find someting to drink soon or you'll start to die from dehydration!", thirstLevel];};
			case (thirstLevel <= 30 && thirstLevel >= 25): {hint format["You haven't drank anything in awhile, your thirst level is %1\n\nYou should find something to drink soon.", thirstLevel];};
			case (thirstLevel <= 50 && thirstLevel >= 45): {hint format["You haven't drank anything in awhile, your thirst level is %1", thirstLevel];};
			};
		};
	};
};

/*[] spawn  {
private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
_walkDis = 0;
_myLastPos = (getPos player select 0) + (getPos player select 1);
_MaxWalk = 650;
while{true} do {
sleep 0.5;
if(!alive player) then {_walkDis = 0;}
else
{
_CurPos = (getPos player select 0) + (getPos player select 1);
if((_CurPos != _myLastPos) && (vehicle player == player)) then
{
	hint format ["%1 / %2", _walkDis, _MaxWalk];
	_walkDis = _walkDis + 1;
	if(_walkDis == _MaxWalk) then
	{
		_walkDis = 0;
		thirstLevel = thirstLevel - 5;
		hungerLevel = hungerLevel - 5;
	};
};
_myLastPos = (getPos player select 0) + (getPos player select 1);
};
};
};
*/