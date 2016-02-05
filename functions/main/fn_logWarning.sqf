#include "..\script_component.hpp"
params ["_message"];
private [];

if ((GVAR(log) find ["Warning", _message]) == -1) then {
    diag_log formatText ["[Poppy] Warning: %1", _message];
    GVAR(log) pushBack ["Warning", _message];
};
