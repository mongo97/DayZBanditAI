//AIKilled Version 0.07
//Updates current live AI count, adds loot to AI corpse if killed by a player, reveals the killer to the victim's group.
private["_weapongrade","_victim","_killer","_killerDist","_removeNVG"];
_victim = _this select 0;
_killer = _this select 1;

_removeNVG = _victim getVariable["removeNVG",0];
if (_removeNVG == 1) then {_victim removeWeapon "NVGoggles";}; //Remove temporary NVGs from AI.

//Set study_body variables.
_victim setVariable["bodyName","DZAI Unit",true];
_victim setVariable["deathType","bled",true];

if (!isPlayer _killer) exitWith {};

_killerDist = _victim distance _killer;

//If alive, Group leader will investigate killer's last known position if it is within 300 meters of the killer.
if (DZAI_findKiller && (_killerDist < 300) && !(_killer hasWeapon "ItemRadio")) then {
	private ["_groupLeader","_killerPos","_unitGroup"];
	_unitGroup = group _victim;
	_groupLeader = leader _unitGroup;
	_unitGroup reveal [_killer,4];
	if (alive _groupLeader) then {
		_killerPos = getPos _killer;
		_groupLeader doMove _killerPos;	_groupLeader moveTo _killerPos;
		//diag_log "DEBUG :: Moving group leader to killer's last known position.";
	} else {
		//diag_log "DEBUG :: Group leader is dead.";
	};
};

_weapongrade = [DZAI_weaponGrades,DZAI_gradeChances1] call fnc_selectRandomWeighted;	//For pistols, calculate weapongrade using default grade chances
if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: AI killed by player. Generating loot with weapongrade %1 (fn_banditAIKilled).",_weapongrade];};
[_victim, _weapongrade] call fnc_unitSelectPistol;				// Add sidearm
[_victim] call fnc_unitConsumables;								// Add food, medical, misc, skin
[_victim] call fnc_unitTools;									// Add tools and gadget
