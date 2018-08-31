
/* ----------------------------------------------------------------------------
Function: btc_fnc_cache_find_pos

Description:
    Fill me when you edit me !

Parameters:
    _city_all - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_cache_find_pos;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_city_all", btc_city_all, [[]]]
];

private _useful = _city_all select {_x getVariable ["occupied", false] && {!(_x getVariable ["type", ""] in ["NameLocal", "Hill", "NameMarine"])}};

if (_useful isEqualTo []) then {_useful = _city_all;};

private _id = floor random count _useful;
private _city = _useful select _id;

if (_city getVariable ["type", ""] in ["NameLocal", "Hill", "NameMarine"]) exitWith {
    [] call btc_fnc_cache_find_pos;
};

btc_cache_cities set [_id, 0];
btc_cache_cities = btc_cache_cities - [0];

private _xx = _city getVariable ["RadiusX", 500];
private _yy = _city getVariable ["RadiusY", 500];
private _pos = [getPos _city, _xx + _yy] call btc_fnc_randomize_pos;
private _houses = [_pos, 50] call btc_fnc_getHouses;

if (_houses isEqualTo []) then {
    [] call btc_fnc_cache_find_pos;
} else {
    private _house = selectRandom _houses;
    _house call btc_fnc_cache_spawn;
};
