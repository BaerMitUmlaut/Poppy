#include "..\script_component.hpp"
params ["_message"];
private [];

if ((GVAR(log) find ["Error", _message]) == -1) then {
    diag_log formatText ["[Poppy] Error: %1", _message];
    GVAR(log) pushBack ["Error", _message];
};
