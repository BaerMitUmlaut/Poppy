#include "..\script_component.hpp"
params ["_unit", "_radio"];

switch (true) do {
    case GVAR(usesACRE): {
        _radio = [_radio] call acre_api_fnc_getBaseRadio;
    };
    case GVAR(usesTFAR): {
        _radio = getText (configFile >> "CfgWeapons" >> _radio >> "tf_parent");
    };
};

switch (true) do {
    case !(_unit canAdd _radio):              { GVAR(overflowItems) pushBack _radio };
    case (_unit canAddItemToUniform _radio):  { _unit addItemToUniform _radio };
    case (_unit canAddItemToBackpack _radio): { _unit addItemToBackpack _radio };
    case (_unit canAddItemToVest _radio):     { _unit addItemToVest _radio };
};
