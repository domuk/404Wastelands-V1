_money = ((nearestobjects [getpos player, ["EvMoney"],  5] select 0) getVariable "money");
if(isNil{_money}) exitWith {};

publicVar_takeMoneyTry = [
	player,
	_money
];
publicVariableServer "publicVar_takeMoneyTry";

player setVariable["cmoney", (player getVariable "cmoney")+_money,true];
deleteVehicle (nearestobjects [getpos player, ["EvMoney"],  5] select 0);
player playmove "AinvPknlMstpSlayWrflDnon";
hint format["You have picked up $%1",_money];