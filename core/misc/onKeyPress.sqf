private["_handled", "_faceCP", "_faceVP"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = false;

if(isstunned) exitwith

	{

	if(_key == 50)then{_handled = true};
	if(_key == 11)then{_handled = true};

	_handled

	};

switch _key do
{
    
    
              
    //U key
    case 22:
    {
        //hint "you pressed the U key";
		execVM "core\admin\checkAdmin.sqf";
    };
    
    //tilde
    case 41:
    {
        [] call waste_fnc_pMenu;
    };
    
    //Y key
    case 21:
    {
        if(((getPlayerUID player) in provingGrounds) || client_isDebug) then
		{
			createDialog "balca_debug_main";
		};
    };
};

_handled;



