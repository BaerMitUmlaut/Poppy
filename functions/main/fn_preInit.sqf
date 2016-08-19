#include "..\script_component.hpp"

Poppy = false;

GVAR(log) = [];
GVAR(usesACRE) = isClass (configFile >> "CfgPatches" >> "acre_sys_core");
GVAR(usesTFAR) = isClass (configFile >> "CfgPatches" >> "task_force_radio");
GVAR(inDevMode) = !isMultiplayer || {is3DENMultiplayer};

Poppy = true;
