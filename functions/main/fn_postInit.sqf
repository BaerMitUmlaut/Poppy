#include "..\script_component.hpp"
private ["_config", "_units", "_className", "_sideConfig"];

if (!hasInterface) exitWith {};

GVAR(log) = [];

_config = missionConfigFile >> "CfgLoadouts";
if !(isClass _config) exitWith {
    ["Poppy could not find your loadout config."] call FUNC(logError);
    [] call FUNC(showMessageBox);
    player addAction ["Configure Loadouts", FUNC(showArsenal), [], 0, false, true];
};

_units = playableUnits;
_units append switchableUnits;
{
    if (local _x) then {
        _className = typeOf _x;
        _sideConfig = [side _x] call FUNC(getSideConfig);

        if (isClass (_config >> _className)) then {
            if !(_className isKindOf [_sideConfig, _config]) then { //(configName (inheritsFrom (_config >> _className)) != _sideConfig) then {
                ["The loadout for """ + _className + """ does not inherit from """ + _sideConfig + """."] call FUNC(logWarning);
            };
            [_x, _className] call FUNC(applyLoadout);
        } else {
            if (isClass (_config >> _sideConfig)) then {
                ["""" + _className + """ does not have a class specific loadout. Applying """ + _sideConfig + """ loadout."] call FUNC(logWarning);
                [_x, _sideConfig] call FUNC(applyLoadout);
            } else {
                ["""" + _className + """ does not have a class specific loadout. Applying default loadout."] call FUNC(logWarning);
            };
        };
    };

    false
} count _units;

[] call FUNC(createBriefingEntry);
if (!isMultiplayer) then {
    player addAction ["Configure Loadouts", FUNC(showArsenal), [], 0, false, true];
};

if (count GVAR(log) > 0) then {
    [] call FUNC(showMessageBox);
};
