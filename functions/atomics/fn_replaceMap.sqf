#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_map"];

_map = _array call BIS_fnc_selectRandom;
_unit unlinkItem "ItemMap";
if (_map != "") then {
    _unit linkItem _map;
};
