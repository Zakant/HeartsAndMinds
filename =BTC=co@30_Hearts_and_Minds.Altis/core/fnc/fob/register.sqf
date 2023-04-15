
/* ----------------------------------------------------------------------------
Function: btc_fob_fnc_register

Description:
   Registers a FOB as a respawn point. This does NOT add the FOB to the save!

Parameters:
    _FOB_name - Name of the FOB. [String]
    _structure - FOB structure. [Object]
    _flag - Flag type. [Object]

Returns:
    _array - Return marker, structure and flag object. [Array]

Examples:
    (begin example)
        ["My FOB", my_fob_structure, my_fob_flag] call btc_fob_fnc_register;
    (end)

Author:
    Zakant

---------------------------------------------------------------------------- */

params [
    ["_FOB_name", "FOB ", [""]],
    ["_structure", objNull, [objNull]],
    ["_flag", objNull, [objNull]],
	["_is_static", false, [true]]
];

// Only run on the server
if (!isServer) exitWith {};

_flag setVariable ["btc_fob_isFOBFlag", true, true];

private _marker = createMarkerLocal [_FOB_name, _structure];
_marker setMarkerSizeLocal [1, 1];
_marker setMarkerTypeLocal "b_hq";
_marker setMarkerTextLocal _FOB_name;
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerShapeLocal "ICON";
_marker setMarkerPos _structure; // Publish the marker

[_flag, "Deleted", {[_thisArgs select 0, _thisArgs select 1] call BIS_fnc_removeRespawnPosition}, [btc_player_side, _flag, _FOB_name] call BIS_fnc_addRespawnPosition] call CBA_fnc_addBISEventHandler;

if (!_is_static) then {
	_fob_structure addEventHandler ["Killed", btc_fob_fnc_killed];
};
_flag setVariable ["btc_fob_can_dismantle", !_is_static, true];


[_marker, _structure, _flag]
