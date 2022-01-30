btc_custom_loc = [
/*
    DESCRIPTION: [POS(Array),TYPE(String),NAME(String),RADIUS (Number),IS OCCUPIED(Bool)]
    Possible types: "NameVillage","NameCity","NameCityCapital","NameLocal","Hill","Airport","NameMarine", "StrongpointArea", "BorderCrossing", "VegetationFir"
    EXAMPLE: [[13132.8,3315.07,0.00128174],"NameVillage","Mountain 1",800,true]
*/
    [[17682.8,5877.69,-0.00650978],"NameCity", "Arobster East", 500, false],
    [[20084.1,18686.8,0.160599],"NameVillage", "South Morar", 400, true],
    [[19262.1,14426.9,-0.00867844],"NameVillage", "Zarath East", 500, false],
    [[19198.6,11531,0.0446091],"NameLocal", "Anyakar Hills", 200, true],
    [[19989.4,7157.31,0.056385],"NameVillage", "North Yemara", 150, false],
    [[20306.5,5130.15,-0.00325775],"NameLocal", "South Yemara", 200, true],
    [[19367.5,4146.69,-0.000717163], "NameVillage", "North Teruk", 200, true],
    [[16481.1,15200.4,0.00151062], "NameLocal", "Zarath River", 200, true],
    [[16406.9,19506.9,-0.00778198], "NameLocal", "South Afart", 150, false],
    [[14796.5,19141.6,0.0162964],"NameVillage", "Kalaenoowi Hills", 200, true],
    [[14285.1,16050.4,0.00468445], "NameVillage", "Ramir East", 150, true],
    [[14645.5,14852.8,0.229752], "NameVillage", "Ramir River", 150, false],
    [[15300,9927.8,0.0215759], "NameLocal", "Puesto Hill", 200, true],
    [[15550.1,7479.39,0.0926285], "NameVillage", "Afsher West", 200, false],
    [[12302.7,2782.98,-0.0103779],"NameVillage", "Airfield East", 400, true],
    [[9919.09,3709.82,0.0115376], "NameVillage", "Airfield North", 400, false],
    [[12928.1,6250.5,0.0194931], "NameLocal", "Orcarif Hill", 150, false],
    [[12083.1,19524.4,-0.00985718], "NameVillage", "Alfaraz East", 150, true],
    [[9437.3,2019.95,0.482948], "NameVillage", "Airfield West", 200, true],
    [[9871.76,6690.51,0.221695], "NameVillage", "West Orcarif", 300, false],
    [[8927.94,12687.9,0.0416412], "NameLocal", "Kunara Hill", 150, true],
    [[9012.27,19981,-0.00305176], "NameVillage", "Doran Hill", 300, true],
    [[8114.49,1969.63,-0.00927734], "NameLocal", "Benamair Hill", 250, true],
    [[8890.53,4848.78,-0.0103035], "NameLocal", "East Amir", 200, false],
    [[8822.24,10896.9,-0.42189], "NameVillage", "Mikis West", 150, true],
    [[5995.23,12767.7,0.739014], "NameVillage", "Kunara River", 200, false],
    [[5530.66,15200.5,0.00848389], "NameLocal", "Shoran River", 150, true],
    [[3164.73,18305.4,-0.415466], "NameLocal", "West Martin", 150, false],
    [[5178.13,18518.1,-0.00915527], "NameVillage", "Nefer Hill", 150, false],
    [[10667.8,8643.26,-0.00310516], "NameVillage", "Morut East", 300, true],
    [[4603.47,2344.47,0.234375], "Hill", "Benamair Mountains", 400, false],
    [[3194.97,4911.26,0.0966797], "Hill", "Abi Mountains", 600, true],
    [[7334.17,7509.07,0.287415], "Hill", "Morut Mountains", 500, true],
    [[12016.5,12488.4,0.0467834], "Hill", "Mikis Mountains", 550, false],
    [[14981.1,13034.7,0.00997925], "Hill", "Ramir Mountains", 500, false],
    [[9895.92,18152,0.0844727], "Hill", "Kandar Mountains", 400, true],
    [[10557.1,16044.1,0.0115356], "Hill", "Tunkuf Mountains", 300, true],
    [[7146.59,9460.33,0.500732], "Hill", "Mafaraz Mountains", 400, false],
    [[1840.14,2439.25,0.732849], "Hill", "Mozarath Mountains", 300, true],
    [[5783.39,6225.76,0.0806885], "Hill", "Amir Mountains", 400, true]
];

/*
    Here you can tweak spectator view during respawn screen.
*/
BIS_respSpecAi = false;                  // Allow spectating of AI
BIS_respSpecAllowFreeCamera = false;     // Allow moving the camera independent from units (players)
BIS_respSpecAllow3PPCamera = false;      // Allow 3rd person camera
BIS_respSpecShowFocus = false;           // Show info about the selected unit (dissapears behind the respawn UI)
BIS_respSpecShowCameraButtons = true;    // Show buttons for switching between free camera, 1st and 3rd person view (partially overlayed by respawn UI)
BIS_respSpecShowControlsHelper = true;   // Show the controls tutorial box
BIS_respSpecShowHeader = true;           // Top bar of the spectator UI including mission time
BIS_respSpecLists = true;                // Show list of available units and locations on the left hand side

/*
    Here you can specify which equipment should be added or removed from the arsenal.
    Please take care that there are different categories (weapons, magazines, items, backpacks) for different pieces of equipment into which you have to classify the classnames.
    In all cases, you need the classname of an object.

    Attention: The function of these lists depends on the setting in the mission parameter (Restrict arsenal).
        - "Full": here you have only the registered items in the arsenal available.
        - "Remove only": here all registered items are removed from the arsenal. This only works for the ACE3 arsenal!

    Example(s):
        private _weapons = [
            "arifle_MX_F",          //Classname for the rifle MX
            "arifle_MX_SW_F",       //Classname for the rifle MX LSW
            "arifle_MXC_F"          //Classname for the rifle MXC
        ];

        private _items = [
            "G_Shades_Black",
            "G_Shades_Blue",
            "G_Shades_Green"
        ];
*/
private _weapons = [];
private _magazines = [];
private _items = [];
private _backpacks = [];

btc_custom_arsenal = [_weapons, _magazines, _items, _backpacks];

/*
    Here you can specify which equipment is loaded on player connection.
*/

private _radio = ["tf_anprc152", "ACRE_PRC148"] select (isClass(configFile >> "cfgPatches" >> "acre_main"));
//Array of colored item: 0 - Desert, 1 - Tropic, 2 - Black, 3 - forest
private _uniforms = ["U_B_CombatUniform_mcam", "U_B_CTRG_Soldier_F", "U_B_CTRG_1", "U_B_CombatUniform_mcam_wdl_f"];
private _uniformsCBRN = ["U_B_CBRN_Suit_01_MTP_F", "U_B_CBRN_Suit_01_Tropic_F", "U_C_CBRN_Suit_01_Blue_F", "U_B_CBRN_Suit_01_Wdl_F"];
private _uniformsSniper = ["U_B_FullGhillie_sard", "U_B_FullGhillie_lsh", "U_B_T_FullGhillie_tna_F", "U_B_T_FullGhillie_tna_F"];
private _vests = ["V_PlateCarrierH_CTRG", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrierH_CTRG", "V_PlateCarrier2_wdl"];
private _helmets = ["H_HelmetSpecB_paint2", "H_HelmetB_Enh_tna_F", "H_HelmetSpecB_blk", "H_HelmetSpecB_wdl"];
private _hoods = ["G_Balaclava_combat", "G_Balaclava_TI_G_tna_F", "G_Balaclava_combat", "G_Balaclava_combat"];
private _hoodCBRN = "G_AirPurifyingRespirator_01_F";
private _laserdesignators = ["Laserdesignator", "Laserdesignator_03", "Laserdesignator_01_khk_F", "Laserdesignator_01_khk_F"];
private _night_visions = ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
private _weapons = ["arifle_MXC_F", "arifle_MXC_khk_F", "arifle_MXC_Black_F", "arifle_MXC_Black_F"];
private _weapons_machineGunner = ["arifle_MX_SW_F", "arifle_MX_SW_khk_F", "arifle_MX_SW_Black_F", "arifle_MX_SW_Black_F"];
private _weapons_sniper = ["arifle_MXM_F", "arifle_MXM_khk_F", "arifle_MXM_Black_F", "arifle_MXM_Black_F"];
private _bipods = ["bipod_01_F_snd", "bipod_01_F_khk", "bipod_01_F_blk", "bipod_01_F_blk"];
private _pistols = ["hgun_P07_F", "hgun_P07_khk_F", "hgun_P07_F", "hgun_P07_khk_F"];
private _launcher_AT = ["launch_B_Titan_short_F", "launch_B_Titan_short_tna_F", "launch_O_Titan_short_F", "launch_B_Titan_short_tna_F"];
private _launcher_AA = ["launch_B_Titan_F", "launch_B_Titan_tna_F", "launch_O_Titan_F", "launch_B_Titan_tna_F"];
private _backpacks = ["B_AssaultPack_Kerry", "B_AssaultPack_eaf_F", "B_AssaultPack_blk", "B_AssaultPack_wdl_F"];
private _backpacks_big = ["B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_rgr", "B_Kitbag_rgr"];
private _backpackCBRN = "B_CombinationUnitRespirator_01_F";

btc_arsenal_loadout = [_uniforms, _uniformsCBRN, _uniformsSniper, _vests, _helmets, _hoods, [_hoodCBRN, _hoodCBRN, _hoodCBRN, _hoodCBRN], _laserdesignators, _night_visions, _weapons, _weapons_sniper, _weapons_machineGunner, _bipods, _pistols, _launcher_AT, _launcher_AA, _backpacks, _backpacks_big, [_backpackCBRN, _backpackCBRN, _backpackCBRN, _backpackCBRN], [_radio, _radio, _radio, _radio]];
