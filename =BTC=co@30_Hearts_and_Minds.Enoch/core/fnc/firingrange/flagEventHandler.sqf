
/* ----------------------------------------------------------------------------
Function: btc_firingrange_fnc_flagEventHandler

Description:
    Handles animation completed event for flags.

Parameters:
    _flag - Flag. [Object]
    _phase - Final animation phase. [Number]

Returns:

Examples:
    (begin example)
        [_flag, 0] call btc_firingrange_fnc_flagEventHandler;
    (end)

Author:
    Zakant

---------------------------------------------------------------------------- */

params [
    ["_flag", objNull, [objNull]],
    ["_phase", 0, [0]]
];

// Get the ranges logic
private _logic = _flag getVariable "btc_firingrange_logic";

// Check if flag has been risen or lowerd
if (_phase > 0.8) then {
    // Flags are up
    // When primary flag do some more stuff
    if (_flag getVariable ["btc_firingrange_isPrimary", false]) then {

        // Adjust status at logic
        _logic setVariable ["btc_firingrange_isChanging", false, true];

        // Toogle the gates once the flags are up
        private _animation = [1, 0] select (_logic getVariable ["btc_firingrange_isLive", false]);
        {
            _x animate ["Door_1_rot", _animation];
        } forEach (_logic getVariable "btc_firingrange_gates");
    };
} else {
    // Flags are down
    // Change the flags color according to new status
    private _texture = 	if (_logic getVariable ["btc_firingrange_isLive", false]) then {
                            "\A3\Data_F\Flags\flag_red_CO.paa"
                        } else {
                            "\A3\Data_F\Flags\flag_green_CO.paa" 
                        };

    _flag setFlagTexture _texture;
    // Raise the flag
    [_flag, 1] call BIS_fnc_animateFlag;
}; 
