#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_watch"];

_watch = _array call BIS_fnc_selectRandom;
_unit unlinkItem "ItemWatch";
if (_watch != "") then {
    _unit linkItem _watch;
};
