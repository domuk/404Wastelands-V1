#define teamkill_dialog 3300
#define teamkill_title 3301
#define teamkill_text 3302
#define teamkill_forgive 3303
#define teamkill_punish 3304

createDialog "TeamkillDialog";

disableSerialization;

_dlg = findDisplay teamkill_dialog;
(_dlg displayCtrl teamkill_title) ctrlSettext (localize "STR_WL_Dlg_TeamkillTitle");
(_dlg displayCtrl teamkill_forgive) ctrlSettext (localize "STR_WL_Dlg_TeamkillForgive");
(_dlg displayCtrl teamkill_punish) ctrlSettext (localize "STR_WL_Dlg_TeamkillPunish");
(_dlg displayCtrl teamkill_text) ctrlSetStructuredText parseText (format [localize "STR_WL_Dlg_TeamkillText",
	format ["<t color=""#aaaaaa"">%1</t>", name pDialogTeamkiller],
	localize format ["STR_WL_Gen_Team%1_2", str(side player)]
]);