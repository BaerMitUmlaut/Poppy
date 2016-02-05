#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_gps"];

_gps = _array call BIS_fnc_selectRandom;
_unit unlinkItem "ItemGPS";
_unit linkItem _gps;
