class CfgPoppy {
    forceShowWarnings = 0;
    forceShowErrors = 1;
    enableAILoadouts = 0;
    showLoadoutInBriefing = 1;
};

class RscPoppyMessageBox {
    idd = -1;
    movingEnable = 0;
    enableSimulation = 1;
    controlsBackground[] = {
        pnlBackground,
        lblHeader,
        lblMessage
    };
    controls[] = {
        btnPrevious,
        btnNext,
        btnClose
    };

    class pnlBackground {
        idc = 0;
        type = 0;
        style = 0;
        moving = 0;
        text = "";
        font = "PuristaMedium";
        sizeEx = 0.03;
        colorBackground[] = {0.2, 0.2, 0.2, 1};
        colorText[] = {0, 0, 0, 0};
        x = safeZoneX + safeZoneW - 0.4;
        y = safeZoneY + safeZoneH;
        w = 0.4 + 0.1;
        h = 0.25 + 0.1;
    };
    class lblHeader {
        idc = 20;
        type = 0;
        style = 0;
        moving = 0;
        text = "";
        font = "PuristaMedium";
        sizeEx = 0.04;
        colorBackground[] = {0, 0, 0, 0};
        colorText[] = {1, 1, 1, 1};
        x = safeZoneX + safeZoneW - 0.4 + 0.015 * 3 / 4;
        y = safeZoneY + safeZoneH + 0.01;
        w = 0.4 - 0.03 * 3 / 4;
        h = 0.06;
    };
    class lblMessage {
        idc = 21;
        type = 0;
        style = 528;
        moving = 0;
        lineSpacing = 1;
        text = "";
        font = "PuristaMedium";
        sizeEx = 0.03;
        colorBackground[] = {0, 0, 0, 0};
        colorText[] = {1, 1, 1, 1};
        x = safeZoneX + safeZoneW - 0.4 + 0.015 * 3 / 4;
        y = safeZoneY + safeZoneH + 0.06;
        w = 0.4 - 0.03 * 3 / 4;
        h = 0.25 - 0.1;
    };

    class btnPrevious {
        idc = 10;
        type = 1;
        style = 2096;
        moving = 0;
        text = "Poppy\UI\previous.paa";
        font = "PuristaBold";
        sizeEx = 0.03;
        borderSize = 0;
        colorBackground[] = {0, 0, 0, 0};
        colorBackgroundActive[] = {0, 0, 0, 0};
        colorBackgroundDisabled[] = {0, 0, 0, 0};
        colorBorder[] = {0, 0, 0, 0};
        colorDisabled[] = {0, 0, 0, 0};
        colorFocused[] = {0, 0, 0, 0};
        colorShadow[] = {0, 0, 0, 0};
        colorText[] = {1, 1, 1, 1};
        default = 0;
        offsetPressedX = 0;
        offsetPressedY = 0;
        offsetX = 0;
        offsetY = 0;
        soundClick[] = {"", 0, 1};
        soundEnter[] = {"", 0, 1};
        soundEscape[] = {"", 0, 1};
        soundPush[] = {"", 0, 1};
        x = safeZoneX + safeZoneW - 0.03 * 3;
        y = safeZoneY + safeZoneH + 0.02;
        w = 0.03;
        h = 0.03;
        onButtonClick = "Poppy_logIndex = Poppy_logIndex - 1; [ctrlParent (_this select 0)] call Poppy_fnc_updateMessageBox;";
    };
    class btnNext: btnPrevious {
        idc = 11;
        text = "Poppy\UI\next.paa";
        x = safeZoneX + safeZoneW - 0.03 * 2;
        y = safeZoneY + safeZoneH + 0.02;
        onButtonClick = "Poppy_logIndex = Poppy_logIndex + 1; [ctrlParent (_this select 0)] call Poppy_fnc_updateMessageBox;";
    };
    class btnClose: btnPrevious {
        idc = 12;
        text = "Poppy\UI\close.paa";
        x = safeZoneX + safeZoneW - 0.03 * 2;
        y = safeZoneY + safeZoneH + 0.02;
        onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 1";
    };
};

class RscPoppyArsenalExtension {
    idd = -1;
    movingEnable = 0;
    enableSimulation = 1;
    controlsBackground[] = {
        pnlBackground
    };
    controls[] = {
        cmbClass
    };

    class pnlBackground {
        idc = 0;
        type = 0;
        style = 0;
        moving = 0;
        text = "";
        font = "PuristaMedium";
        sizeEx = 0.03;
        colorBackground[] = {0.2, 0.2, 0.2, 1};
        colorText[] = {0, 0, 0, 0};
        x = (safeZoneX + safeZoneW) / 2 - 0.3;
        y = safeZoneY + 0.05;
        w = 0.6;
        h = 0.1;
    };

    class cmbClass {
        idc = 10;
        type = 4;
        style = 16;
        moving = 0;
        font = "PuristaMedium";
        sizeEx = 0.08;
        blinkingPeriod = 0;
        shadow = 0;
        borderSize = 0;
        colorBackground[] = {0, 0, 0, 0};
        colorSelectBackground[] = {1, 1, 1, 0.1};
        colorBackgroundActive[] = {0, 0, 0, 0};
        colorBackgroundDisabled[] = {0, 0, 0, 0};
        colorBorder[] = {0, 0, 0, 0};
        colorDisabled[] = {0, 0, 0, 0};
        colorFocused[] = {0, 0, 0, 0};
        colorShadow[] = {0, 0, 0, 0};
        colorText[] = {1, 1, 1, 1};
        colorSelect[] = {1, 1, 1, 1};
        pictureColor[] = {1, 1, 1, 1};
        pictureColorSelect[] = {1, 1, 1, 1};
        pictureColorDisabled[] = {1, 1, 1, 1};
        arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
        arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
        wholeHeight = 0.08 * 6;
        maxHistoryDelay = 1;
        default = 0;
        soundExpand[] = {"", 0, 1};
        soundCollapse[] = {"", 0, 1};
        soundSelect[] = {"", 0, 1};
        x = (safeZoneX + safeZoneW) / 2 - 0.3 + 0.01;
        y = safeZoneY + 0.05 + 0.01;
        w = 0.58;
        h = 0.08;
        class ComboScrollBar {
            arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
            arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
            border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
            thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
            color[] = {1, 1, 1, 1};
        };
    };
};

class RscPoppyAssistantExport {

};
