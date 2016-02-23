#include "..\script_component.hpp"
params ["_unit", "_array"];
private ["_radio", "_findPos"];

_radio = selectRandom _array;

_findPos = _radio find "ACRE";
if (_findPos != -1) then {
    // - ACRE ---------------------------------------------
    _findPos = _radio find "_ID_";
    if (_findPos != -1) then {
        _radio = getText (configFile >> "CfgWeapons" >> _radio >> "acre_baseClass");
    };
} else {
    // - TFAR ---------------------------------------------
    _findPos = _radio find "tf_";
    if (_findPos == 0 && {(configName inheritsFrom (configFile >> "CfgWeapons" >> _radio)) != "ItemRadio"}) then {
        _radio = configName inheritsFrom (configFile >> "CfgWeapons" >> _radio);
    };
};

_unit unlinkItem "ItemRadio";
if (_radio != "") then {
    _unit linkItem _radio;
};

//["It's not recommended to replace the radio through Poppy. Use your radio mods auto replacement function instead."] call FUNC(logWarning);
