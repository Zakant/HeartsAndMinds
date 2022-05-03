
/* ----------------------------------------------------------------------------
Function: btc_firingrange_fnc_toggleState

Description:
    Toogles the state of a firing range.

Parameters:
    _flag - Flag that was used to toogle the state. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] call btc_firingrange_fnc_toggleState;
    (end)

Author:
    Zakant

---------------------------------------------------------------------------- */

params [
    ["_flag", objNull, [objNull]]
];

// This only needs to run on the server
// Might want to use events but remoteExecCall is so much easier...
if (!isServer) exitWith {
	[_flag] remoteExecCall ["btc_firingrange_fnc_toggleState", 2];
};

// Get the ranges logic
private _logic = _flag getVariable "btc_firingrange_logic";

// Get the new state and set it
private _newState = !(_logic getVariable ["btc_firingrange_isLive", false]);
_logic setVariable ["btc_firingrange_isLive", _newState, true];

// Move all flags down
{
	[_x, 0] call BIS_fnc_animateFlag;	
} forEach (_logic getVariable "btc_firingrange_flags");

// Set variable indicating change
_logic setVariable ["btc_firingrange_isChanging", true, true];
