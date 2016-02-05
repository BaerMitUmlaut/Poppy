#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_goggles"];

_goggles = _array call BIS_fnc_selectRandom;
if (_goggles != goggles _unit) then {
    removeGoggles _unit;
    _unit addGoggles _goggles;
};
