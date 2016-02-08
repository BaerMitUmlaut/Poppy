#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_headgear"];

_headgear = _array call BIS_fnc_selectRandom;
if (_headgear != headgear _unit) then {
    removeHeadgear _unit;
    if (_headgear != "") then {
        _unit addHeadgear _headgear;
    };
};
