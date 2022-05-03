
/* ----------------------------------------------------------------------------
Function: btc_firingrange_fnc_createAction

Description:
    Creates the hold action for a flag.
    Must run on every machine and JIP!

Parameters:
    _flag - Flag. [Object]

Returns:

Examples:
    (begin example)
        [_flag] call btc_firingrange_fnc_createAction;
    (end)

Author:
    Zakant

---------------------------------------------------------------------------- */

params [
    ["_flag", objNull, [objNull]]
];

// Create the action and attach it
[ _flag,
  localize "STR_BTC_HAM_ACTION_TOOGLE_RANGE",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_requestleadership_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_requestleadership_ca.paa",
  '!((_target getVariable "btc_firingrange_logic") getVariable "btc_firingrange_isChanging")',
  "true",
  {}, {},
  { [_this#0] call btc_firingrange_fnc_toggleState; },
  {}, [], 5, 1000, false] call BIS_fnc_holdActionAdd;
    
