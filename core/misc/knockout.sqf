_unit = _this select 0;
sleep 35;

if(animationState player == "adthpercmstpslowwrfldnon_4") then
{
_unit switchMove "amovppnemstpsnonwnondnon";
[nil,_unit,rSwitchMove, "amovppnemstpsnonwnondnon"] call RE;
};