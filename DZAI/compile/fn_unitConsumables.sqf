//unitConsumables Version 0.07
/*
	Usage: [_unit] call fnc_unitConsumables;
*/
	private ["_unit"];
	_unit = _this select 0;
	
	//Add one guaranteed Bandage to inventory
	_unit addMagazine "ItemBandage";

	//Chance to add miscellaneous item (Small) to backpack
	for "_i" from 1 to DZAI_numMiscItemS do {
		if ((random 1) < DZAI_chanceMiscItemS) then {
			private ["_miscItemS"];
			_miscItemS = DZAI_DefaultMiscItemS call BIS_fnc_selectRandom;
			(unitBackpack _unit) addMagazineCargoGlobal [_miscItemS,1];
			if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Misc Item (Small): %1 for AI.",_miscItemS];};
		};
	};
	
	//Chance to add miscellaneous item (Large) to backpack
	for "_i" from 1 to DZAI_numMiscItemL do {
		if ((random 1) < DZAI_chanceMiscItemL) then {
			private["_miscItemL"];
			_miscItemL = DZAI_DefaultMiscItemL call BIS_fnc_selectRandom;
			(unitBackpack _unit) addMagazineCargoGlobal [_miscItemL,1];
			if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Misc Item (Large): %1 for AI.",_miscItemL];};
		};
	};
		
	//Chance to add skin to backpack
	if ((random 1) < DZAI_skinItemChance) then {
		private["_skinItem"];
		_skinItem = DZAI_DefaultSkinLoot call BIS_fnc_selectRandom;
		(unitBackpack _unit) addMagazineCargoGlobal [_skinItem,1];
		if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Skin Item: %1 for AI.",_skinItem];};
	};
	
	//Add medical items to backpack
	for "_i" from 1 to DZAI_bpmedicals do {
		private["_bpmedical"];
		_bpmedical = DZAI_DefaultMedicals2 call BIS_fnc_selectRandom;
		(unitBackpack _unit) addMagazineCargoGlobal [_bpmedical, 1];
		if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Backpack Medical Item: %1 for AI.",_bpmedical];};
	};

	//Add edible items to backpack
	for "_i" from 1 to DZAI_bpedibles do {
		private["_bpedible"];
		_bpedible = DZAI_DefaultEdibles call BIS_fnc_selectRandom;
		(unitBackpack _unit) addMagazineCargoGlobal [_bpedible, 1];
		if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Backpack Edible Item: %1 for AI.",_bpedible];};
	};
	
	//Add medical items to inventory
	for "_i" from 1 to DZAI_invmedicals do {
		private["_invmedical"];
		_invmedical = DZAI_DefaultMedicals1 call BIS_fnc_selectRandom;
		_unit addMagazine [_invmedical, 1];
		if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Inventory Medical Item: %1 for AI.",_invmedical];};
	};
	
	//Add edible items to inventory
	for "_i" from 1 to DZAI_invedibles do {
		private["_invedible"];
		_invedible = DZAI_DefaultEdibles call BIS_fnc_selectRandom;
		_unit addMagazine [_invedible, 1];
		if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Inventory Edible Item: %1 for AI.",_invedible];};
	};
	
	if (DZAI_modName == "epoch") then {
		private ["_itemBar","_index","_chance","_metalBarCount"];
		_metalBarCount = (count DZAI_metalBars);
		//diag_log format ["DEBUG :: Counted %1 bars in DZAI_metalBars.",_metalBarCount];
		for "_i" from 0 to DZAI_metalBarNum do {
			_index = floor (random _metalBarCount);
			_chance = ((DZAI_metalBars select _index) select 1);
			//diag_log format ["DEBUG :: %1 chance to add bar.",_chance];
			if ((random 1) < _chance) then {
				_itemBar = ((DZAI_metalBars select _index) select 0);
				_unit addMagazine _itemBar;
				//diag_log format ["DEBUG :: Added bar %1 as loot to AI corpse.",_itemBar];
			};
		};
	};
