//Namalsk Loot Configuration 0.08
private ["_modname"];
_modname = toLower format ["%1",DZAI_modName];

//Setting common between Namalsk and Namalsk 2017
DZAI_invmedicals = 1; 	//Number of selections of medical items (Inventory)
DZAI_invedibles = 1;	//Number of selections of edible items (Inventory)
DZAI_bpmedicals = 1; 	//Number of selections of medical items (Backpack)
DZAI_bpedibles = 0;		//Number of selections of edible items (Backpack)

DZAI_BanditTypesDefault = DZAI_BanditTypesDefault + ["CamoWinterW_DZN", "CamoWinter_DZN", "Sniper1W_DZN"];
DZAI_DefaultSkinLoot = DZAI_DefaultSkinLoot + ["Skin_Sniper1W_DZN","Skin_CamoWinter_DZN","Skin_CamoWinterW_DZN"];
DZAI_tempNVGs = false;	//Disable temporary NVG chance for DayZ Namalsk.

switch (_modname) do {
	case "epoch":
	{
		#include "mod_configs\epoch_config.sqf"
	};
	case "2017" :
	{
		DZAI_weaponGrades = [0,1,2];
		DZAI_gradeChances0 = [0.90,0.10,0.00];
		DZAI_gradeChances1 = [0.65,0.30,0.05];
		DZAI_gradeChances2 = [0.30,0.45,0.15];
		DZAI_gradeChances3 = [0.25,0.55,0.20];
		//Overwrite default weapon tables
		DZAI_PistolsDefault0 = ["Makarov","Tokarev"];
		DZAI_PistolsDefault1 = ["Tokarev"];
		DZAI_PistolsDefault2 = ["Tokarev"];
		DZAI_RiflesDefault0 = ["MR43","Mosin38","Winchester1866","Crossbow"];
		DZAI_RiflesDefault1 = ["Mosin38","Winchester1866"];
		DZAI_RiflesDefault2 = ["Mosin38","M16_FlashLight","M4_FlashLight","Winchester1866"];
		//Reduce gadget probabilities
		DZAI_gadgets set [0,["binocular",0.50]];
		DZAI_gadgets set [1,["NVGoggles",0.000]];	//Reduce probability of functional NVGs
		//Reduce tool probabilities
		DZAI_tools set [0,["ItemFlashlight",0.00]];
		DZAI_tools set [2,["ItemKnife",0.65]];
		DZAI_tools set [3,["ItemHatchet",0.60]];
		DZAI_tools set [4,["ItemCompass",0.40]];
		DZAI_tools set [5,["ItemMap",0.30]];
		DZAI_tools set [7,["ItemFlint",0.20]];		//Replace ItemMatchbox with ItemFlint
		DZAI_tools set [8,["ItemFlashlightRed",0.00]];
		DZAI_tools set [9,["ItemGPS",0.000]];		//Reduce probability of functional GPS
		//Overwrite default backpack tables
		DZAI_Backpacks0 = ["ice_apo_pack3"];
		DZAI_Backpacks1 = ["ice_apo_pack3","ice_apo_pack1"];
		DZAI_Backpacks2 = ["ice_apo_pack1","ice_apo_pack4","ice_apo_pack2"];
		DZAI_Backpacks3 = ["ice_apo_pack4","ice_apo_pack2"];
		diag_log "Namalsk 2017 loot tables loaded.";
	};
	default {
		DZAI_gradeChances0 = [0.85,0.13,0.02,0.00];	
		DZAI_gradeChances2 = [0.50,0.46,0.10,0.01];						
		DZAI_gradeChances2 = [0.20,0.60,0.15,0.05];									
		DZAI_gradeChances3 = [0.00,0.60,0.33,0.07];	
		DZAI_PistolsDefault0 = DZAI_PistolsDefault0 + ["MakarovSD_DZN"];
		if ((dayzNam_buildingLoot == "CfgBuildingLootNamalsk") || (dayzNam_buildingLoot == "CfgBuildingLootNamalskNOER7")) then {
			DZAI_RiflesDefault1 = DZAI_RiflesDefault1 + ["Saiga12K_DZN", "AKS_74_UN_kobra_DZN","RPK_74_DZN","AK_47_S","AK_74_GL","AK_107_kobra","AK_107_GL_kobra"];
			DZAI_RiflesDefault2 = DZAI_RiflesDefault2 + ["Saiga12K_DZN","AKS_74_UN_kobra_DZN","AK_107_GL_pso_DZN","G36_C_SD_eotech_DZN","PK_DZN","RPK_74_DZN","VSS_vintorez_DZN","MG36_DZN","AKS_74_pso","AK_74_GL","AK_107_kobra","AK_107_pso","AKS_GOLD_DZN","AK_47_S"];
			DZAI_RiflesDefault3 = DZAI_RiflesDefault3 + ["PK_DZN", "Pecheneg_DZN", "KSVK_DZN", "AKS_GOLD_DZN","BAF_L85A2_UGL_ACOG_DZN","Bizon"];
			} else { //No-sniper setting
			DZAI_RiflesDefault0 = DZAI_RiflesDefault0 - ["huntingrifle"];
			DZAI_RiflesDefault1 = DZAI_RiflesDefault1 - ["M24","DMR"] + ["Saiga12K_DZN", "AKS_74_UN_kobra_DZN","RPK_74_DZN","AK_47_S","AK_74_GL","AK_107_kobra","AK_107_GL_kobra"];
			DZAI_RiflesDefault2 = DZAI_RiflesDefault2 - ["M24","SVD_CAMO","M107_DZ","DMR","M16A4_ACG"] + ["Saiga12K_DZN","AKS_74_UN_kobra_DZN","AK_107_GL_pso_DZN","G36_C_SD_eotech_DZN","PK_DZN","RPK_74_DZN","MG36_DZN","AKS_74_pso","AK_74_GL","AK_107_kobra","AK_107_pso","AK_107_GL_kobra","AK_47_S"];
			DZAI_RiflesDefault3 = DZAI_RiflesDefault3 - ["FN_FAL_ANPVS4","M107_DZ","BAF_AS50_scoped","DMR","BAF_L85A2_RIS_SUSAT"] + ["PK_DZN", "Pecheneg_DZN", "AKS_GOLD_DZN","Bizon"];
		};
		DZAI_Backpacks1 = DZAI_Backpacks1 + ["BAF_AssaultPack_DZN"];
		DZAI_Backpacks2 = DZAI_Backpacks2 + ["BAF_AssaultPack_DZN"];
		DZAI_gadgets set [1,["NVGoggles",0.005]];	//Reduce probability of functional NVGs
		DZAI_tools set [9,["ItemGPS",0.005]];		//Reduce probability of functional GPS
		DZAI_tools = DZAI_tools + [["BrokenItemGPS",0.04],["BrokenNVGoggles",0.04],["BrokenItemRadio",0.02],["ItemSolder",0.01],["APSI",0.01]];	//Add Namalsk tools
		diag_log "Namalsk loot tables loaded.";
	};
};

DZAI_RiflesDefault0 = DZAI_RiflesDefault0 + DZAI_PistolsDefault0;
