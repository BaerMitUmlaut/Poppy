#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_vest"];

_vest = _array call BIS_fnc_selectRandom;
if (_vest != vest _unit) then {
    removeVest _unit;
    if (_vest != "") then {
        _unit addVest _vest;
    };
};
