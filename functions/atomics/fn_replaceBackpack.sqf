#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_backpack"];

_backpack = _array call BIS_fnc_selectRandom;
if (_backpack != backpack _unit) then {
    removeBackpack _unit;
    if (_backpack != "") then {
        _unit addBackpack _backpack;
    };
};
