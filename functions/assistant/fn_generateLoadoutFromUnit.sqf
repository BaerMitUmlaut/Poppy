#include "..\script_component.hpp"
params ["_unit"];
private ["_magazines", "_compass", "_gps", "_map", "_radio", "_watch"];

_magazines = primaryWeaponMagazine _unit;
_magazines append handgunMagazine _unit;
_magazines append secondaryWeaponMagazine _unit;
_magazines append magazines _unit;

_compass = ""; _gps = ""; _map = ""; _radio = ""; _watch = "";
{
    switch true do {
        case (_x isKindOf "ItemCompass"): {_compass = _x};
        case (_x isKindOf "ItemGPS"): {_compass = _x};
        case (_x isKindOf "ItemMap"): {_compass = _x};
        case (_x isKindOf "ItemWatch"): {_compass = _x};
    };
} count (assignedItems _unit);

[
    [uniform _unit], [vest _unit], [backpack _unit],
    _magazines, items _unit,
    [binocular _unit], [_compass], [goggles _unit],
    [_gps], [headgear _unit], [_map],
    [hmd _unit], [_radio], [_watch],
    [primaryWeapon _unit] + primaryWeaponItems _unit, [handgunWeapon _unit] + handgunItems _unit, [secondaryWeapon _unit] + secondaryWeaponItems _unit,
    [_unit getVariable ["bis_fnc_setUnitInsignia_class", ""]]
]
