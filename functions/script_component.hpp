#define PREFIX Poppy

#define QUOTE(var) #var
#define DOUBLES(var1,var2) ##var1##_##var2
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3

#define GVAR(var) DOUBLES(PREFIX,var)
#define QGVAR(var) QUOTE(GVAR(var))
#define FUNC(var) TRIPLES(PREFIX,fnc,var)
#define QFUNC(var) QUOTE(FUNC(var))

#define VERSION "0.9.0"

/*
    Loadout Indexes
    Defines the structure of any loadout array. Order:
    -Containers
    -Items
    -Gear
    -Weapons
    -Special
*/

#define LOADOUT_INDEXES [ \
    "uniform", "vest", "backpack", \
    "magazines", "items", \
    "binoculars", "compass", "goggles", \
    "gps", "headgear", "map", \
    "nvgs", "watch", \
    "primary", "secondary", "launcher", \
    "insignia"]
