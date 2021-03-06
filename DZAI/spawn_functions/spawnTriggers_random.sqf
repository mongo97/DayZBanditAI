/*
	spawnTriggers_random version 0.08

	Usage: 
	Description: 
*/
private ["_numTriggers","_refMarker","_patrolDist","_maxDist","_equipType","_markerPos","_trigOnAct","_patroldist"];
if (!isServer) exitWith {};

_numTriggers = _this select 0;							//Number of triggers to create
_refMarker = _this select 1;							//Reference marker ("center")
_patrolDist = _this select 2;
_maxDist = _this select 3;								//Maximum distance from reference marker to generate triggers
_equipType = if ((count _this) > 4) then {_this select 4} else {1};

if (_numTriggers == 0) exitWith {};						// Exit script if there is nothing to spawn

_markerPos = getMarkerPos _refMarker;					//Get position of reference marker
_trigOnAct = format["[%1,%2,%3,thisTrigger,%4] call fnc_spawnBandits_random_NR",DZAI_dynAIMin,DZAI_dynAIAdd,_patroldist,_equipType];

if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: %1 Trigger spawns triggered (spawnTriggers_random).",_numTriggers];};

for "_i" from 1 to _numTriggers do {
	private ["_trigger","_trigPos"];
	sleep DZAI_dynSpawnDelay;
	_trigPos = [_markerPos,random(_maxDist),random(360),false,[1,500]] call SHK_pos;
	if (DZAI_debugMarkers == 1) then {													//Adjust to debugLevel > 1
		private ["_markername","_marker"];
		_markername = format["marker_%1",floor(random 200)];
		_marker = createMarker[_markername,_trigPos];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "WAYPOINT";
		_marker setMarkerBrush "SOLID";
		_marker setMarkerColor "ColorYellow";
	};
	_trigger = createTrigger ["EmptyDetector",_trigPos];
	_trigger setTriggerArea [500, 500, 0, false];
	_trigger setTriggerActivation ["ANY", "PRESENT", true];
	_trigger setTriggerTimeout [10, 15, 20, true];
	_trigger setTriggerStatements ["{isPlayer _x} count thisList > 0;",_trigOnAct, "[thisTrigger] spawn fnc_despawnBandits_NR;"];
	if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: Trigger %1 of %2 spawned at %3 (spawnTriggers_random).",_i,_numTriggers,_trigPos];};
	DZAI_curDynTrigs = DZAI_curDynTrigs + 1;
};
