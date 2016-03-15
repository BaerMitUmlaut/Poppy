#include "..\script_component.hpp"
private ["_config", "_units", "_className", "_sideConfig"];

if (isServer) then { [] call FUNC(synchGroupIDs) };
if (!hasInterface) exitWith {};

// - Setup checks -----------------------------------------
if !(isClass (missionConfigFile >> "RscPoppyMessageBox")
    && isClass (missionConfigFile >> "CfgPoppy")) exitWith {
    hint parseText ("<t color='#cf1226' size='2'>Warning</t><br />"
        + """Poppy.cfg"" was not included in your description.ext. "
        + "Please go through the setup instructions again to check "
        + "how to setup Poppy properly.<br /><br />"
        + "Because of this error, Poppy will not work properly and "
        + "will now shutdown.");
};
_config = missionConfigFile >> "CfgLoadouts";
if !(isClass _config) exitWith {
    ["Poppy could not find your loadout config."] call FUNC(logError);
    [] spawn FUNC(showMessageBox);
    player addAction ["Configure Loadouts", FUNC(showArsenal), [], 0, false, true];
};

// - Applying loadouts ------------------------------------
_units = playableUnits;
_units append switchableUnits;
{
    if (local _x) then {
        _className = typeOf _x;
        _sideConfig = [side group _x] call FUNC(getSideConfig);

        if (isClass (_config >> _className)) then {
            if !(_className isKindOf [_sideConfig, _config]) then {
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

        _x selectWeapon (primaryWeapon _x);
    };

    false
} count _units;

// - Misc -------------------------------------------------
if (getNumber (missionConfigFile >> "CfgPoppy" >> "showLoadoutInBriefing") == 1) then {
    [] call FUNC(createBriefingEntry);
};

if (!isMultiplayer) then {
    player addAction ["Configure Loadouts", FUNC(showArsenal), [], 0, false, true];
};

if (count GVAR(log) > 0) then {
    [] spawn FUNC(showMessageBox);
};
