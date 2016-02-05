#include "..\script_component.hpp"
params ["_unit", "_loadoutClass"];

private _config = missionConfigFile >> "CfgLoadouts" >> _loadoutClass;
GVAR(delayedItems) = [];

// - Containers -------------------------------------------
if (isArray (_config >> "uniform")) then {
    [_unit, _loadoutClass, getArray (_config >> "uniform")] call FUNC(replaceUniform);
};
if (isArray (_config >> "vest")) then {
    [_unit, _loadoutClass, getArray (_config >> "vest")] call FUNC(replaceVest);
};
if (isArray (_config >> "backpack")) then {
    [_unit, _loadoutClass, getArray (_config >> "backpack")] call FUNC(replaceBackpack);
};

// - Items ------------------------------------------------
if (isArray (_config >> "magazines")) then {
    [_unit, _loadoutClass, getArray (_config >> "magazines")] call FUNC(replaceMagazines);
};
if (isArray (_config >> "items")) then {
    [_unit, _loadoutClass, getArray (_config >> "items")] call FUNC(replaceItems);
};

// - Gear -------------------------------------------------
if (isArray (_config >> "binoculars")) then {
    [_unit, _loadoutClass, getArray (_config >> "binoculars")] call FUNC(replaceBinoculars);
};
if (isArray (_config >> "compass")) then {
    [_unit, _loadoutClass, getArray (_config >> "compass")] call FUNC(replaceCompass);
};
if (isArray (_config >> "goggles")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(replaceGoggles);
};
if (isArray (_config >> "gps")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(replaceGPS);
};
if (isArray (_config >> "headgear")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(replaceHeadgear);
};
if (isArray (_config >> "map")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(replaceMap);
};
if (isArray (_config >> "nvgs")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(replaceNVGs);
};
if (isArray (_config >> "radio")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(replaceRadio);
};
if (isArray (_config >> "watch")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(replaceWatch);
};

// - Weapons ----------------------------------------------
if (isArray (_config >> "primary")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(replacePrimary);
};
if (isArray (_config >> "secondary")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(replaceSecondary);
};
if (isArray (_config >> "launcher")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(replaceLauncher);
};

// - Other ------------------------------------------------
if (isArray (_config >> "insignia")) then {
    [_unit, _loadoutClass, getArray (_config >> "")] call FUNC(setInsignia);
};

_loadoutArray = [];
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
    "primary", "secondary", "launcher"
];

{
    if (isArray (_config >> _x)) then {
        [_unit, _loadoutClass, getArray (_config >> _x)] call (missionNamespace getVariable (QUOTE(TRIPLES(PREFIX,fnc,_)) + _x));
    };
} forEach _loadoutIndexArray;

];

// - Delayed Items ----------------------------------------
{
    if (_unit canAdd _x) then {
        _unit addItem _x;
    } else {
        ["Inventory full! Could not add """ + _x + """ to """ + (typeOf _unit) + """."] call FUNC(logWarning);
    };
    false
} count GVAR(delayedItems);
