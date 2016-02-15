#include "..\script_component.hpp"
private ["_display", "_cmbClass", "_availableClasses", "_sideConfig"];

_display = uiNamespace getVariable "RscDisplayArsenal";
_cmbClass = _display ctrlCreate ["RscXListBox", 929479];
_cmbClass ctrlSetPosition [
    SafeZoneX + SafeZoneW / 2 - 0.3,
    SafeZoneY + 0.05,
    0.6,
    0.08
];
_cmbClass ctrlSetFontHeight 0.06;
_cmbClass ctrlCommit 0;

_availableClasses = [];
{
    if (side _x == side player) then {
        _availableClasses pushBack (typeOf _x);
    };
    false
} count switchableUnits;
_availableClasses = _availableClasses arrayIntersect _availableClasses;

if (isNil QGVAR(availableClasses)) then {
    GVAR(availableClasses) = [[side player] call FUNC(getSideConfig)];
    GVAR(availableClasses) append _availableClasses;

    GVAR(classLoadoutArrays) = [[GVAR(availableClasses) select 0] call FUNC(generateLoadoutFromConfig)];
    {
        if (side _x == side player) then {
            GVAR(classLoadoutArrays) set [GVAR(availableClasses) find (typeOf _x), [_x] call FUNC(generateLoadoutFromUnit)];
        };
        false
    } count switchableUnits;
};

_sideConfig = [side player] call FUNC(getSideConfig);
_cmbClass lbAdd _sideConfig;
_cmbClass lbSetData [0, _sideConfig];
for "_i" from 0 to (count _availableClasses) - 1 do {
    _cmbClass lbAdd (getText (configFile >> "CfgVehicles" >> (_availableClasses select _i) >> "displayName"));
    _cmbClass lbSetData [_i + 1, _availableClasses select _i];
};
_cmbClass lbSetCurSel 0;
GVAR(cmbClassLastIndex) = 0;

_cmbClass ctrlAddEventHandler ["LBSelChanged", { _this call FUNC(handleArsenalClassChanged) }];

GVAR(arsenalOpen) = true;
