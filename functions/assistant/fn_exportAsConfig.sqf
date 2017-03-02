#include "..\script_component.hpp"

private _nl            = toString [13, 10];
private _result        = "class CfgLoadouts {" + _nl;
private _commonLoadout = GVAR(classLoadoutArrays) select 0;
{
    private _classIndex = _forEachIndex;
    if (_classIndex != 0) then {
        _result = _result + "    class " + _x + ": " + (GVAR(availableClasses) select 0) + " {" + _nl;
    } else {
        _result = _result + "    class " + _x + " {" + _nl;
    };
    {
        private _loadoutAtom = GVAR(classLoadoutArrays) select _classIndex select _forEachIndex;
        if !((_loadoutAtom isEqualTo (_commonLoadout select _forEachIndex)) && (_classIndex != 0)) then {
            _result = _result + "        " + _x + "[] = ";
            _loadoutAtom = [str _loadoutAtom, "[", "{"] call CBA_fnc_replace;
            _loadoutAtom = [_loadoutAtom, "]", "}"] call CBA_fnc_replace;
            _result = _result + _loadoutAtom + ";" + _nl;
        };
    } forEach LOADOUT_INDEXES;
    _result = _result + "    };" + _nl;
} forEach GVAR(availableClasses);
_result = _result + "};";

copyToClipboard _result;
_result
