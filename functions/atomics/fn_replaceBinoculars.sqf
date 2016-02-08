#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_binoculars"];

_binoculars = _array call BIS_fnc_selectRandom;
if (_binoculars != binocular _unit) then {
    _unit unlinkItem (binocular _unit);
    if (_binoculars != "") then {
        _unit linkItem _binoculars;
    };
};
