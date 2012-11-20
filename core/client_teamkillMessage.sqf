#define teamkill_info_idc 3500

11 cutrsc["TeamkillMessage", "PLAIN"];

disableSerialization;

_display = uiNamespace getVariable "TeamkillMessage";
_control = _display displayCtrl teamkill_info_idc;

playSound "IncomingChallenge";

sleep 30;

_control ctrlSetFade 1;
_control ctrlCommit 2;

waitUntil {ctrlCommitted _control};

_control ctrlShow false;
_control ctrlCommit 0;

11 cutrsc["Default", "PLAIN"];