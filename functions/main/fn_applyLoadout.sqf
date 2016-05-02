#include "..\script_component.hpp"
params ["_unit", "_loadout"];
private ["_loadConfig", "_config", "_loadoutArray", "_function"];

_loadConfig = (typeName _loadout == "STRING");
_config = configNull;
if (_loadConfig) then {
    _config = missionConfigFile >> "CfgLoadouts" >> _loadout;
};

GVAR(delayedItems) = [];
{
    _function = missionNamespace getVariable (QUOTE(TRIPLES(PREFIX,fnc,replace)) + _x);
    if (_loadConfig) then {
        if (isArray (_config >> _x)) then {
            [_unit, getArray (_config >> _x)] call _function;
        };
    } else {
        [_unit, _loadout select _forEachIndex] call _function;
    };
} forEach LOADOUT_INDEXES;

if (GVAR(usesACRE)) then {
    [_unit] spawn FUNC(setupRadios);
    [_unit] call FUNC(applyRadioLoadout);
};

// Delayed items
{
    if (_unit canAdd _x) then {
        _unit addItem _x;
    } else {
        ["Inventory full! Could not add """ + _x + """ to """ + (typeOf _unit) + """."] call FUNC(logWarning);
    };
    false
} count GVAR(delayedItems);

_unit selectWeapon (primaryWeapon _unit);

if (_loadConfig) then {
    [_unit, _loadout] call compile (getText (_config >> "postLoadout"));
};
