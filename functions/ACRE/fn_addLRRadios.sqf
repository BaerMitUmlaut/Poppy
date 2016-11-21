#include "..\script_component.hpp"
params ["_unit", "_array"];

{
    if !([_x] call acre_api_fnc_isBaseRadio) then {
        _x = [_x] call acre_api_fnc_getBaseRadio;
    };

    [_unit, _currentItem, [UNIFORM, BACKPACK, VEST]] call FUNC(addItemSorted);
    false
} count _array;
