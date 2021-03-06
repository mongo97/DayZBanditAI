//Utes map configuration 0.08

//Begin dynamic trigger settings for Utes
if (DZAI_dynTriggersMax == "auto") then {DZAI_dynTriggersMax = 5;};
if (DZAI_dynSpawnDelay == "auto") then {DZAI_dynSpawnDelay = 30;};
if (DZAI_dynEquipType == "auto") then {DZAI_dynEquipType = 3;};
if (DZAI_dynAIMin == "auto") then {DZAI_dynAIMin = 2;};
if (DZAI_dynAIAdd == "auto") then {DZAI_dynAIAdd = 3;};

//begin triggers
_this = createTrigger ["EmptyDetector", [3376.7136, 4402.3555, 0]];
_this setTriggerArea [500, 500, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", true];
_this setTriggerTimeout [20, 40, 60, true];
_this setTriggerText "DZAI Trigger";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,0,125,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_0 = _this;

_this = createTrigger ["EmptyDetector", [3561.8384, 3708.8481]];
_this setTriggerArea [500, 500, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", true];
_this setTriggerTimeout [20, 40, 60, true];
_this setTriggerText "DZAI Trigger";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,0,125,thisTrigger,[],3] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_2 = _this;

_this = createTrigger ["EmptyDetector", [3855.0464, 3373.2051]];
_this setTriggerArea [500, 500, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", true];
_this setTriggerTimeout [20, 40, 60, true];
_this setTriggerText "DZAI Trigger";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,0,125,thisTrigger,[],3] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_4 = _this;

_this = createTrigger ["EmptyDetector", [4355.46, 3207.3979, 0.34515762]];
_this setTriggerArea [500, 500, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", true];
_this setTriggerTimeout [20, 40, 60, true];
_this setTriggerText "DZAI Trigger";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,0,125,thisTrigger,[],0] call fnc_spawnBandits;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_6 = _this;

//end of triggers

//Add your custom markers here


//End of custom markers

//Add your custom triggers here


//End of custom triggers

diag_log "Utes map configuration loaded.";
