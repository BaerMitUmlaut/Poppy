#include "..\script_component.hpp"
disableSerialization;
private ["_display"];

sleep 1;
_display = findDisplay 46 createDisplay "RscPoppyMessageBox";
GVAR(logIndex) = 0;
[_display] call FUNC(updateMessageBox);
[_display] call FUNC(slideMessageBoxUp);
