
/* ----------------------------------------------------------------------------
Function: btc_firingrange_fnc_setup

Description:
    Setup a firering range with flags and gates.

Parameters:
    _logic - Range logic. [Object]
    _objects - Flags and gates belonging to the range. [Array]

Returns:

Examples:
    (begin example)
        [cursorObject, synchronizedObjects cursorObject] call btc_firingrange_fnc_setup;
    (end)

Author:
    Zakant

---------------------------------------------------------------------------- */

params [
    ["_logic", objNull, [objNull]],
    ["_objects", [], [[]]]
];

// Sort the objects into flags and gates
private _flags = _objects select {_x isKindOf "FlagCarrier"};
private _gates = _objects - _flags;

// Setup the ranges logic
_logic setVariable ["btc_firingrange_isLive", false, true];
_logic setVariable ["btc_firingrange_isChanging", false, true];
_logic setVariable ["btc_firingrange_flags", _flags, true];
_logic setVariable ["btc_firingrange_gates", _gates, true];

// Setup the flags
{
    // Attach the flag animation event handler
    [_x, "FlagAnimationDone", { call btc_firingrange_fnc_flagEventHandler;}] call BIS_fnc_addScriptedEventHandler;

    // Set the core logic
    _x setVariable ["btc_firingrange_logic", _logic, true];

    // Set the flags to "green"
    _x setFlagTexture "\A3\Data_F\Flags\flag_green_CO.paa";

    // Attach the "toogle" action
    // Needs to run on every client and jip!
    [_x] remoteExec ["btc_firingrange_fnc_createAction", [0, -2] select isDedicated, true]; 
} forEach _flags;

// Select one flag as the "primary" one
// The eventhandler of that flag is used to determain when the transition is completed
(_flags select 0) setVariable ["btc_firingrange_isPrimary", true, true];

// Open all the gates
{
    _x animate ["Door_1_rot", 1];
} forEach _gates;
