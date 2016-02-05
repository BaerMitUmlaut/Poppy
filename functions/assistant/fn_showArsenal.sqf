#include "..\script_component.hpp"

["Open", true] spawn BIS_fnc_arsenal;
GVAR(arsenalOpen) = false;

[{
    params ["", "_pfhID"];
    private ["_display", "_cmbClass", "_availableClasses", "_units", "_sideConfig"];
    disableSerialization;

    if !(isNull (uiNamespace getVariable "RscDisplayArsenal")) then {
        if !(GVAR(arsenalOpen)) then {
            _display = uiNamespace getVariable "RscDisplayArsenal";
            //_display = _display createDisplay "RscPoppyArsenalExtension";
            //_cmbClass = _display displayCtrl 10;
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
            _units = playableUnits;
            _units append switchableUnits;

            {
                _availableClasses pushBack (typeOf _x);
                false
            } count _units;
            _availableClasses = _availableClasses arrayIntersect _availableClasses;

            if (isNil QGVAR(availableClasses)) then {
                GVAR(availableClasses) = [[side player] call FUNC(getSideConfig)];
                GVAR(availableClasses) append _availableClasses;

                GVAR(classLoadoutArrays) = [[GVAR(availableClasses) select 0] call FUNC(generateLoadoutFromConfig)];
                {
                    GVAR(classLoadoutArrays) set [GVAR(availableClasses) find (typeOf _x), [_x] call FUNC(generateLoadoutFromUnit)];
                    false
                } count _units;
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

            _cmbClass ctrlAddEventHandler ["LBSelChanged", {
                params ["_control", "_index"];

                GVAR(classLoadoutArrays) set [GVAR(cmbClassLastIndex), [player] call FUNC(generateLoadoutFromUnit)];
                [player, GVAR(classLoadoutArrays) select (GVAR(availableClasses) find (_control lbData _index))] call FUNC(applyLoadout);

                GVAR(cmbClassLastIndex) = _index;
            }];

            GVAR(arsenalOpen) = true;
        };
    } else {
        if (!isNil QGVAR(arsenalOpen) && {GVAR(arsenalOpen)}) then {
            [] call FUNC(exportAsConfig);
            GVAR(log) = [["Info", "Your new loadout config has been copied to your clipboard, simply paste it into your description.ext and reload your mission."]];
            [] spawn FUNC(showMessageBox);
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
