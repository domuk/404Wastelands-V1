waste_fnc_pMenu = compile preprocessFile "player_system\init.sqf"; //Wasteland Player Menu
onRespawn = compile preprocessfile "core\onRespawn.sqf"; //Precompile OnRespawn actions
onKilled = compile preprocessfile "core\onKilled.sqf"; //Precompile OnKilled actions
onFired = compile preprocessfile "core\onFired.sqf"; //Precompile OnFired actions
onHit = compile preprocessfile "core\onHit.sqf";
waste_fnc_hit = compile preprocessfile "core\misc\hit.sqf"; //PreCompile rifle butt/punch
waste_fnc_dropFood = compile preprocessfile "core\misc\inv_fnc.sqf"; //Precompile inv Dropfood

client_randomSpawn = compile preprocessFileLineNumbers "core\misc\client_randomSpawn.sqf";
client_setHit = compile preprocessFileLineNumbers "core\misc\client_setHit.sqf";
client_updateMissionsMarkers = compile preprocessFileLineNumbers "core\misc\client_updateMissionsMarkers.sqf";
client_initShopsMarkers = compile preprocessFileLineNumbers "core\client_initShopsMarkers.sqf";
teamkillAction = compile preprocessFileLineNumbers "core\doTeamKillAction.sqf";
teamkillMessage = compile preprocessFileLineNumbers "core\showTeamKillMessage.sqf";
client_respawnDialog = compile preprocessFileLineNumbers "core\client_respawnDialog.sqf";
client_respawnAction = compile preprocessFileLineNumbers "core\client_respawnAction.sqf";
client_spawnStuff = compile preprocessFileLineNumbers "core\client_spawnStuff.sqf";
client_CompareTime = compile preprocessFileLineNumbers "core\misc\client_CompareTime.sqf";

client_compiledScripts = true;