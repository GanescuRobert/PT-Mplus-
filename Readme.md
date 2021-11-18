# PT-Mplus-

To generate *lex.yy.c*:
```
flex lexer.l
```  
then add **#includ "symbols.h"** in it.

In lex.yy.c you have to add **#include "lex.yy.c"**.

To generate *lexer.exe* and run it:
```
gcc -o lexer lexer.c
lexer.exe
```

To generate *c.tab.c* & *c.tab.h*:
```
bison -d c.y
```