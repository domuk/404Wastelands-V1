hint "This feature is no longer available";
/*
if((side player == west) or (side player == east)) exitwith {hint "This feature is only available through being a Civilian";};
private["_temp","_player"];
if(RogueVar) then {
	_player = name player;
	_temp = createGroup civilian;
	[player] joinSilent _temp;
	player addRating 1;
	RogueVar = false;
	hint "You are now back as a civilian.";
	[player,nil,rHINT,format["%1 went back to being a Civilian, Civilians and other factions may no longer see them as a threat.", _player]] call RE;
} else 
{	
	_player = name player;
	_temp = createGroup resistance;
	[player] joinSilent _temp;
	player addRating -1000;
	RogueVar = true;
	hint "You are now a rogue player bound to no team mates free to kill, rob and attack other civilians, blufor and opfor.";
	[player,nil,rHINT,format["%1 has went rogue! Civilians and other factions watch out for him/her!", _player]] call RE;
};
*/