#include "..\script_component.hpp"
params ["_unit"];
private ["_missionSQM", "_sideGroups", "_groupIDs", "_groupOffsets", "_groupOffsetsSorted", "_unitGroupIndex", "_unitGroupOffset", "_result"];

_missionSQM = loadFile "mission.sqm";
if (count _missionSQM >= 9999999) exitWith {
    ["Poppy could not reliably detect the group channel due to an unusually large mission.sqm file."] call FUNC(logWarning);
    1
};

_sideGroups = allGroups select {side _x == side group _unit};
_groupIDs = _sideGroups apply {groupID _x};
_groupOffsets = _groupIDs apply {_missionSQM find _x};
_groupOffsetsSorted = +_groupOffsets;
_groupOffsetsSorted sort true;
_unitGroupIndex = _sideGroups find (group _unit);
_unitGroupOffset = _groupOffsets select _unitGroupIndex;

_result = (_groupOffsetsSorted find _unitGroupOffset) + 1;
if (_result < 1) then { _result = 1 };
_result
