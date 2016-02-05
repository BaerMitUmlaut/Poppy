#include "..\script_component.hpp"
disableSerialization;
params ["_display", ["_speed", 3]];

private _height = (ctrlPosition (_display displayCtrl 0)) select 3;

[{
    disableSerialization;
    params ["_args", "_pfhID"];
    _args params ["_display", "_speed", "_height", "_startTime"];
    private ["_positionXYWH", "_currentHeight", "_targetHeight", "_newHeight", "_deltaHeight", "_ctrl", "_ctrlPosition"];

    _positionXYWH = ctrlPosition (_display displayCtrl 0);

    _currentHeight = (SafeZoneY + SafeZoneH) - (_positionXYWH select 1);
    _targetHeight = (_positionXYWH select 3) - 0.1; //0.1 buffer
    _newHeight = _targetHeight min ((time - _startTime) * _targetHeight * _speed);

    _deltaHeight = _newHeight - _currentHeight;

    {
        _ctrl = (_display displayCtrl _x);
        _ctrlPosition = ctrlPosition _ctrl;
        _ctrl ctrlSetPosition [
            _ctrlPosition select 0,
            (_ctrlPosition select 1) - _deltaHeight,
            _ctrlPosition select 2,
            _ctrlPosition select 3
        ];
        _ctrl ctrlCommit 0;

        false
    } count [0, 10, 11, 12, 20, 21];

    if (_targetHeight == _newHeight) then {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [_display, _speed, _height, time]] call CBA_fnc_addPerFrameHandler;
