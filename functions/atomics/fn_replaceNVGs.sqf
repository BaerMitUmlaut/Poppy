#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_nvgs"];

_nvgs = _array call BIS_fnc_selectRandom;
if (_nvgs != hmd _unit) then {
    _unit unlinkItem (hmd _unit);
    if (_nvgs != "") then {
        _unit linkItem _nvgs;
    };
};
