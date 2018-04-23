params ["_group"];

private _units          = units _group;
private _type_db        = 0;
private _array_pos      = [];
private _array_type     = [];
private _side           = side (leader _group);
private _array_dam      = [];
private _behaviour      = [behaviour (leader _group), combatMode _group, formation _group];
private _array_wp       = [];
private _array_in_veh   = [];
private _array_veh      = [];
private _index_wp       = 0;

{
    private _pos = getPosATL _x;
    if (surfaceIsWater _pos) then {
        _array_pos pushBack getPos _x;
    } else {
        _array_pos pushBack _pos;
    };

    _array_type pushBack typeOf _x;
    _array_dam pushBack getDammage _x;
} foreach _units;

_index_wp = (currentWaypoint _group) + 1;
{
    _array_wp append [[waypointPosition _x, waypointType _x, waypointSpeed _x, waypointFormation _x, waypointCombatMode _x, waypointBehaviour _x]];
} foreach waypoints _group;


if (_group getVariable ["stop", false]) then {_type_db = 2;};
if !(_group getVariable ["inHouse", ""] isEqualTo "") then {_type_db = 3;
    _array_veh = _group getVariable ["inHouse", false];
};
if (_group getVariable ["getWeapons", false]) then {_type_db = 4;};
if (_group getVariable ["suicider", false]) then {_type_db = 5;};
if !(_group getVariable ["btc_data_inhouse", []] isEqualTo []) then {_type_db = 6;
    _array_veh = _group getVariable ["btc_data_inhouse", false];
};
if (_group getVariable ["btc_ied_drone", false]) then {_type_db = 7;};
if ((vehicle leader _group != leader _group) && !(_type_db isEqualTo 7)) then {_type_db = 1;};

if (_type_db isEqualTo 1) then {
    private _veh = vehicle leader _group;
    private _type = typeOf _veh;
    private _pos = getPosATL _veh;
    private _dir = getDir _veh;
    private _fuel = fuel _veh;
    _array_veh = [_type, _pos, _dir, _fuel];
};
_data = [_type_db, _array_pos, _array_type, _side, _array_dam, _behaviour, [_index_wp, _array_wp], _array_veh];

if ((_type_db isEqualTo 1) || (_type_db isEqualTo 7)) then {
    deletevehicle vehicle leader _group;
};
{deletevehicle _x} foreach _units;
deleteGroup _group;

_data
