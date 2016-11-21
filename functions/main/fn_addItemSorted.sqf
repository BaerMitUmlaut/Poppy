#include "..\script_component.hpp"
params ["_unit", "_item", "_sorting"];

if !(_unit canAdd _item) exitWith {
    GVAR(overflowItems) pushBack _item;
};

private _containers = [
    uniformContainer _unit,
    vestContainer _unit,
    backpackContainer _unit
];
private _containersSorted = _sorting apply {_containers select _x};

{
    if (_x canAdd _item) exitWith {
        _x addItem _item;
    };
} forEach _containersSorted;
