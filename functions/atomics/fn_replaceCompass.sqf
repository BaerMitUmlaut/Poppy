#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_compass"];

_compass = _array call BIS_fnc_selectRandom;
_unit unlinkItem "ItemCompass";
if (_compass != "") then {
    _unit linkItem _compass;
};
