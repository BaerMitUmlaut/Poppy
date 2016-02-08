#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_uniform"];

_uniform = _array call BIS_fnc_selectRandom;
if (_uniform != uniform _unit) then {
    removeUniform _unit;
    if (_uniform != "") then {
        _unit forceAddUniform _uniform;
    };
};