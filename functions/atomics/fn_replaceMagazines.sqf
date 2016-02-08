#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_arrayCount", "_currentItem"];

_arrayCount = count _array;

{ _unit removeMagazineGlobal _x; } count (magazines _unit);

if (_array isEqualTo [""]) exitWith {};

for "_i" from 0 to (_arrayCount - 1) do {
    _currentItem = _array select _i;

    if ((_i + 1 < _arrayCount) && {typeName (_array select (_i + 1)) == "SCALAR"}) then {
        for "_j" from 1 to (_array select (_i + 1)) do {
            switch (true) do {
                case (_unit canAddItemToVest _currentItem):     { _unit addItemToVest _currentItem };
                case (_unit canAddItemToBackpack _currentItem): { _unit addItemToBackpack _currentItem };
                case (_unit canAddItemToUniform _currentItem):  { _unit addItemToUniform _currentItem };
                default { GVAR(delayedItems) pushBack _currentItem };
            };
        };
        _i = _i + 1;
    } else {
        switch (true) do {
            case (_unit canAddItemToVest _currentItem):     { _unit addItemToVest _currentItem };
            case (_unit canAddItemToBackpack _currentItem): { _unit addItemToBackpack _currentItem };
            case (_unit canAddItemToUniform _currentItem):  { _unit addItemToUniform _currentItem };
            default { GVAR(delayedItems) pushBack _currentItem };
        };
    };
};
