#include "..\script_component.hpp"
params ["_unit", "_loadout"];
private ["_loadConfig", "_config", "_loadoutArray", "_function"];

_loadConfig = (typeName _loadout == "STRING");
_config = configNull;
if (_loadConfig) then {
    _config = missionConfigFile >> "CfgLoadouts" >> _loadout;
};

_loadoutIndexArray = [
    /* - Containers ------------------ */
    "uniform", "vest", "backpack",

    /* - Items ----------------------- */
    "magazines", "items",

    /* - Gear ------------------------ */
    "binoculars", "compass", "goggles",
    "gps", "headgear", "map",
    "nvgs", "radio", "watch",

    /* - Weapons --------------------- */
    "primary", "secondary", "launcher",

    /* - Special --------------------- */
    "insignia"
];

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
} forEach _loadoutIndexArray;

// Delayed items
{
    if (_unit canAdd _x) then {
        _unit addItem _x;
    } else {
        ["Inventory full! Could not add """ + _x + """ to """ + (typeOf _unit) + """."] call FUNC(logWarning);
    };
    false
} count GVAR(delayedItems);
