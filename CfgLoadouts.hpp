class CfgLoadouts {
    class CommonBlufor {
        uniform[] = {"U_B_CTRG_1", "U_B_CTRG_3"};
        backpack[] = {""};
        vest[] = {"V_PlateCarrier2_blk"};
        headgear[] = {"H_HelmetB_light", "H_HelmetB_light_black", "H_HelmetB_light_snakeskin"};
        goggles[] = {""};
        nvgs[] = {""};
        primary[] = {
            {"arifle_SPAR_01_blk_F", "optic_Holosight_blk_F", "muzzle_snds_M"},
            {"arifle_SPAR_01_snd_F", "optic_Holosight_blk_F", "muzzle_snds_M"}
        };
        secondary[] = {"hgun_ACPC2_F"};
        magazines[] = {
            "30Rnd_556x45_Stanag", 6,
            "30Rnd_556x45_Stanag_Tracer_Red", 2,
            "9Rnd_45ACP_Mag", 2,
            "HandGrenade", 2,
            "SmokeShell", 2,
            "SmokeShellRed",
            "SmokeShellGreen"
        };
        items[] = {
            "ACE_fieldDressing", 4,
            "ACE_packingBandage", 4,
            "ACE_elasticBandage", 4,
            "ACE_quikclot", 4,
            "ACE_morphine",
            "ACE_earplugs"
        };
        insignia[] = {"CTRG"};
    };
    class B_Soldier_SL_F: CommonBlufor {
        primary[] = {
            {"arifle_SPAR_01_GL_blk_F", "optic_Arco_blk_F", "muzzle_snds_M"},
            {"arifle_SPAR_01_GL_snd_F", "optic_Arco_blk_F", "muzzle_snds_M"}
        };
        magazines[] = {
            "30Rnd_556x45_Stanag", 6,
            "30Rnd_556x45_Stanag_Tracer_Red", 2,
            "9Rnd_45ACP_Mag", 2,
            "1Rnd_HE_Grenade_shell", 11,
            "1Rnd_Smoke_Grenade_shell", 3,
            "1Rnd_SmokeBlue_Grenade_shell", 3,
            "1Rnd_SmokeRed_Grenade_shell", 3,
            "SmokeShell", 2,
            "SmokeShellRed",
            "SmokeShellGreen"
        };
        backpack[] = {"B_AssaultPack_rgr", "B_AssaultPack_blk"};
    };
    class B_Soldier_AR_F: CommonBlufor {
        backpack[] = {"B_AssaultPack_rgr", "B_AssaultPack_blk"};
        primary[] = {"LMG_03_F", "optic_Holosight_blk_F"};
        magazines[] = {
            "200Rnd_556x45_Box_Red_F", 5,
            "9Rnd_45ACP_Mag", 2,
            "SmokeShell", 2,
            "SmokeShellRed",
            "SmokeShellGreen"
        };
    };
    class B_Soldier_GL_F: CommonBlufor {
        primary[] = {
            {"arifle_SPAR_01_GL_blk_F", "optic_Holosight_blk_F", "muzzle_snds_M"},
            {"arifle_SPAR_01_GL_snd_F", "optic_Holosight_blk_F", "muzzle_snds_M"}
        };
        magazines[] = {
            "30Rnd_556x45_Stanag", 6,
            "30Rnd_556x45_Stanag_Tracer_Red", 2,
            "9Rnd_45ACP_Mag", 2,
            "1Rnd_HE_Grenade_shell", 31,
            "SmokeShell", 2,
            "SmokeShellRed",
            "SmokeShellGreen"
        };
        backpack[] = {"B_AssaultPack_rgr", "B_AssaultPack_blk"};
    };
    class B_medic_F: CommonBlufor {
        backpack[] = {"B_Kitbag_rgr"};
        items[] = {
            "ACE_fieldDressing", 25,
            "ACE_packingBandage", 25,
            "ACE_elasticBandage", 25,
            "ACE_quikclot", 25,
            "ACE_morphine", 10,
            "ACE_epinephrine", 10,
            "ACE_salineIV_500", 10,
            "ACE_tourniquet", 10,
            "ACE_surgicalKit", 5,
            "ACE_earplugs"
        };
    };
};
