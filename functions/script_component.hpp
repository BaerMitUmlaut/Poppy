#define PREFIX Poppy

#define QUOTE(var) #var
#define DOUBLES(var1,var2) ##var1##_##var2
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3

#define GVAR(var) DOUBLES(PREFIX,var)
#define QGVAR(var) QUOTE(GVAR(var))
#define FUNC(var) TRIPLES(PREFIX,fnc,var)
#define QFUNC(var) QUOTE(FUNC(var))

#define VERSION "0.7.0"