#include "..\script_component.hpp"
disableSerialization;

sleep 1;
private _display = findDisplay 46 createDisplay "RscPoppyMessageBox";
GVAR(logIndex) = 0;
[_display] call FUNC(updateMessageBox);
[_display] call FUNC(slideMessageBoxUp);
