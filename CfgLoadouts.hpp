class CfgLoadouts {
    class CommonBlufor {
        uniform[] = {"TFA_green_tiger", "TFA_green_tiger_rs"};
        backback[] = {""};
        vest[] = {"TFAx_PlateCarrierH_Grn"};
        headgear[] = {"TFA_Mich_Green", "TFA_Mich_Black"};
        goggles[] = {""};
        nvgs[] = {""};
        primary[] = {
            {"rhs_weap_mk18_grip2_KAC", "BWA3_optic_EOTech", "ACE_acc_pointer_green"},
            {"rhs_weap_mk18_grip2", "BWA3_optic_EOTech", "ACE_acc_pointer_green"},
            {"rhs_weap_mk18_KAC", "BWA3_optic_EOTech", "ACE_acc_pointer_green"},
            {"rhs_weap_mk18", "BWA3_optic_EOTech", "ACE_acc_pointer_green"}
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
        insignia[] = {"molonlabe"};
    };
    class B_Soldier_SL_F: CommonBlufor {
        primary[] = {
            {"rhs_weap_mk18_m320", "BWA3_optic_EOTech", "ACE_acc_pointer_green"}
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
        backpack[] = {"TFA_assault_FOL", "TFA_assault_BLK"};
    };
    class B_Soldier_AR_F: CommonBlufor {
        goggles[] = {"BWA3_G_Combat_Black"};
        backpack[] = {"TFA_assault_FOL", "TFA_assault_BLK"};
        primary[] = {"rhs_weap_m249_pip_S", "BWA3_optic_EOTech"};
        magazines[] = {
            "rhs_200rnd_556x45_M_SAW", 5,
            "9Rnd_45ACP_Mag", 2,
            "SmokeShell", 2,
            "SmokeShellRed",
            "SmokeShellGreen"
        };
    };
    class B_Soldier_GL_F: CommonBlufor {
        primary[] = {
            {"rhs_weap_mk18_m320", "BWA3_optic_EOTech", "ACE_acc_pointer_green"}
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
        backpack[] = {"TFA_assault_FOL", "TFA_assault_BLK"};
    };
    class B_medic_F: CommonBlufor {
        backpack[] = {"TFA_assault_FOL", "TFA_assault_BLK"};
        items[] = {
            "ACE_fieldDressing", 25,
            "ACE_packingBandage", 25,
            "ACE_elasticBandage", 25,
            "ACE_quikclot", 20,
            "ACE_morphine", 10,
            "ACE_epinephrine", 10,
            "ACE_plasmaIV_500", 10,
            "ACE_tourniquet", 10,
            "ACE_surgicalKit", 5,
            "ACE_earplugs"
        };
        insignia[] = {"Medic"};
    };
};
