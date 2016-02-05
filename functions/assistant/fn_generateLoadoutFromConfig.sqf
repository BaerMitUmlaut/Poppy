#include "..\script_component.hpp"
params ["_class"];
private ["_config", "_loadoutIndexArray", "_loadoutArray"];

_config = missionConfigFile >> "CfgLoadouts" >> _class;

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

_loadoutArray = [];
{
    _loadoutArray pushBack getArray (_config >> _x);
    false
} count _loadoutIndexArray;

_loadoutArray
