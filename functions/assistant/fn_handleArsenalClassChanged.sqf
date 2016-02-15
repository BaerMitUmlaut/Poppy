#include "..\script_component.hpp"
params ["_control", "_index"];
private ["_newCommonLoadout", "_commonLoadoutDiff", "_diffIndexes", "_classLoadout"];

if (GVAR(cmbClassLastIndex) == 0) then {
    [] call FUNC(applyCommonLoadoutDiff);
    [player, GVAR(classLoadoutArrays) select (GVAR(availableClasses) find (_control lbData _index))] call FUNC(applyLoadout);
} else {
    GVAR(classLoadoutArrays) set [GVAR(cmbClassLastIndex), [player] call FUNC(generateLoadoutFromUnit)];
    [player, GVAR(classLoadoutArrays) select (GVAR(availableClasses) find (_control lbData _index))] call FUNC(applyLoadout);
};

GVAR(cmbClassLastIndex) = _index;
