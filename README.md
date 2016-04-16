# Poppy
A reliable, self configuring, error finding loadout framework for Arma.

## About
Poppy is a loadout framework that was made with the following three goals in
mind:

- be as simple and easy as possible to use without hindering power users
- decrease the users workflow by finding possible errors and letting the user
  know of them
- cope with various common modifications and known issues such as inventory
  desynchronization

Poppy achieves this by combining the best of existing loadout frameworks and
adding some special sauce on top.

## Features
The following features are supported by Poppy by default:
- Loadout creation through the Virtual Arsenal
- Inventory sorting
- Automatic creation of briefing entries with the current loadout
- Detailed Error and Warning messages when mistakes are detected
- JIP compatibility
- Full ACRE and TFAR compatibility
- Automatic distribution of long range radios with ACRE
- Automatic 343 channel selection with ACRE

Poppy has a few additonal features which are available for more advanced users:
- Loadout randomization
- Simplified loadout configs
- AI loadouts (coming soon)

## Usage

### Setup
The following steps describe how to include Poppy into your mission:

1. Download the latest version of Poppy from the
   [releases page](https://github.com/BaerMitUmlaut/Poppy/releases).
2. Open your mission's folder, usually found at

    ```
    MyDocuments\Arma 3 - Other Profiles\<profile name>\missions\<mission name>.<map name>`.
    ```

3. Copy the Poppy folder into your mission's folder.
4. If you haven't already, create a `description.ext` file in your mission's
   folder. Add the following lines to it:

    ```
    #include "Poppy\CfgPoppy.hpp"
    class CfgFunctions {
        #include "Poppy\CfgFunctions.hpp"
    };
    ```

5. Your folder structure should now look like this:

    ```
    <mission name>.<map name>
    ├── Poppy
    │   ├── functions
    │   │   └── ...
    │   ├── UI
    │   │   └── ...
    │   ├── CfgFunctions.hpp
    │   ├── CfgPoppy.hpp
    │   └── Dialog.hpp
    ├── description.ext
    └── mission.sqm
    ```

   If there are differences between the above folder structure and your folder
   structure, fix them now or your game might crash (thanks BI).
6. If you have your mission already open in the editor, reopen it so it
   refreshes the mission's files.

### Creating basic loadouts
In this section you will learn how to create loadouts from scratch without any
technical knowledge about Poppy. Simply follow these steps:

1. Place down all playable units you want to have in your mission and make sure
   there is one unit marked as player. Note that Poppy will ignore any
   non-playable/non-player units.
2. Preview your mission. An error message saying "Poppy could not find your
   loadout config." will appear because you don't have any loadouts configured
   yet. Don't panic!
3. In your action menu (the scroll wheel menu) you will now find an entry named
   "Configure loadouts". Select that entry and the Virtual Arsenal will open
   up.
4. You will see a large box at the top of your screen with two arrow buttons
   next to it. This will show what unit type you are currently editing. If you
   just opened up the arsenal it will say "CommonBlufor" or "CommonOpfor" and
   so on. When you edit this "common" loadout, any changes you make will be
   applied to all units. This is extremly useful for defining the uniform,
   vest or weapon (almost) all of your units use.
5. You should now select the loadout that is almost the same for all units.
   This will most likely include the uniform, the vest, grenades, medical gear
   and so on.
6. Once you're done, click the right arrow. You are now editing the class that
   is shown in the box above.
7. Note that items and magazines might have been resorted in your vest, uniform
   and backback. The amount of items and magazines however will remain the
   same as in the common loadout.
8. Once you have equipped all units, simply close the arsenal. Poppy will show
   a message in the bottom right, informing you that the loadout has been
   copied to your clipboard.
9. Open your `description.ext` again. Add an empty line at the bottom, and
   press Ctrl + V to paste the loadout. Make sure to save the file.
10. Reopen your mission in the editor and hit preview again. All playable units
    will now have the loadouts you created earlier.

If you want to change something about your loadouts, you can select the
"Configure loadouts" option in your action menu at any point. However, you need
to make sure you ovewrite any loadout configs instead of just adding the config
below the old one.

### Loadouts for advanced users
Poppy uses a loadout config. This means you will need to create some very basic
configs. If you have never seen a config before, I'd highly suggest to use the
basic automatically generated loadouts from above and learn from them.

The loadout config has the following base structure:
```
class CfgLoadouts {
    class Common<Blufor|Opfor|Independant|Civilian> {
        uniform[] = {...};
        vest[] = {...};
        backpack[] = {...};
        magazines[] = {...};
        items[] = {...};
        binoculars[] = {...};
        compass[] = {...};
        goggles[] = {...};
        gps[] = {...};
        headgear[] = {...};
        map[] = {...};
        nvgs[] = {...};
        watch[] = {...};
        primary[] = {...};
        secondary[] = {...};
        launcher[] = {...};
        insignia[] = {...};
        lrRadios[] = {...};
    };
    class <unit class name>: Common<Blufor|Opfor|Independant|Civilian> {
        ...
    };
};
```

As you can see arrays are used for all config entries. This is for supporting
randomness - almost all config entries support randomness. This means if you
you have multiple entries, Poppy will select one of them randomly.

There are a few special entries:
- **primary[]**  
  Primary takes a special format to support attachments:  
  `{"weapon", "attachment", "attachment", "attachment"}`  
  Multiple of these subarrays are supported. You only need to fill this
  array with the attachment slots you use.
- **secondary[]**  
  Same as *primary*.
- **launcher[]**  
  Same as *primary*.
- **magazines[]**  
  Magazines does not support randomness for obvious reasons. Additionally, you
  can simplify your loadouts by using  
  `..., <magazine class name>, <amount of magazines>,...`.
- **items[]**  
  Same as *magazines*.
- **lrRadios[]**  
  This does also not support randomness. All radios within this array will be
  given to the unit.

### Changing Poppy's settings
Poppy has a few settings that allow you little bit more customization. You can
find them in the `CfgPoppy.hpp` file. You can easily change them by editing
that file. Note that due to how configs work you will have to `0` to disable a
setting and `1` to enable a setting.
- **forceShowInfos**  
  Show info messages in multiplayer.
- **forceShowWarnings**  
  Show warning messages in multiplayer.
- **forceShowErrors**  
  Show error messages in multiplayer.
- **showLoadoutInBriefing**  
  Show the loadout of the player on the briefing screen.
- **enableAILoadoutsSP**
  Enables loadouts for playable AI units in singleplayer.

If you're using ACRE, there's a few more settings you can change:
- **distributeGroupLeaderRadios**  
  Enabling this will automatically give each group leader a long range radio.
- **groupLeaderRadio**  
  This radio will be given to all group leaders if you enabled the setting
  above.
- **channelNames[]**  
  These are the channel names that will be assigned to the long range radio
  channels, in the given order. These channel names apply to all radio types.
