#include "..\script_component.hpp"
params ["_unit", "_magazine"];
private ["_compatibleMagazines"];

{
    _compatibleMagazines = getArray (configfile >> "CfgWeapons" >> _x >> "magazines");
    if (_magazine in _compatibleMagazines) exitWith { true };
    false
} forEach [primaryWeapon _unit, handgunWeapon _unit, secondaryWeapon _unit];
