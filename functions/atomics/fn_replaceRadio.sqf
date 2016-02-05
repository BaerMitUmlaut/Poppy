#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_radio"];

_radio = _array call BIS_fnc_selectRandom;
_unit unlinkItem "ItemRadio";
_unit linkItem _radio;

["It's not recommended to replace the radio through Poppy. Use your radio mods auto replacement function instead."] call FUNC(logWarning);
