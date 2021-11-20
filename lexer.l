digit        [0-9]
alpha        [a-zA-Z]

%{
#include <stdio.h>
#include "c.tab.h"

void count();
void warning();
void comment();
int check_type();
%}

%%
"/*"        { comment(); }
"%"            { comment(); } 

"+"            { count(); return(ADD); }
"-"            { count(); return(SUB); }
"*"            { count(); return(MUL); }
"/"            { count(); return(DIV); }

"&&"        { count(); return(AND); }
"||"        { count(); return(OR); }
"not"        { count(); return(NOT); }

"="            { count(); return(EQUAL); }
"<"            { count(); return(LT); }
">"            { count(); return(GT); }
"=<"        { count(); return(LE); }
">="        { count(); return(GE); }

":="        { count(); return(ASSIGN); }

"("            { count(); return(LPAR); }
")"            { count(); return(RPAR); }
"{"            { count(); return(CLPAR); }
"}"            { count(); return(CRPAR); }
"["            { count(); return(SLPAR); }
"]"            { count(); return(SRPAR); }

":"            { count(); return(COLON); }
";"            { count(); return(SEMICOLON); }
","            { count(); return(COMMA); }

"if"        { count(); return(IF); }
"then"        { count(); return(THEN); }
"while"        { count(); return(WHILE); }
"do"        { count(); return(DO); }
"read"        { count(); return(READ); }
"else"        { count(); return(ELSE); }
"begin"        { count(); return(BEGINN); }
"end"        { count(); return(END); }
"print"        { count(); return(PRINT); }
"int"        { count(); return(INT); }
"bool"        { count(); return(BOOL); }
"real"        { count(); return(REAL); }
"var"        { count(); return(VAR); }
"size"        { count(); return(SIZE); }
"float"        { count(); return(FLOAT); }
"floor"        { count(); return(FLOOR); }
"ceil"        { count(); return(CEIL); }
"fun"        { count(); return(FUN); }
"return"    { count(); return(RETURN); }
"false"        { count(); return(BVAL); } 
"true"        { count(); return(BVAL); }

({alpha}+)[_{digit}{alpha}]*    { count(); return(check_type());}
{digit}+                        { count(); return(IVAL);}  
{digit}*.{digit}+                { count(); return(RVAL);}    

{alpha}?\"(\\.|[^\\"])*\"        { count(); return(STRING_LITERAL); }

[ \t\v\n\f]        { count(); }
.                { warning(); }

%%

int yywrap()
{
    return(1);
}

void comment()
{
    char c, c1;

    while(1){
        while ((c = input()) != '*' && c != 0)
            putchar(c);

        if ((c1 = input()) == '/' || c == 0)
        {
            unput(c1);
        break;
        }
    putchar(c1);
    }
}

int column = 0;
void count()
{
    int i;

    for (i = 0; yytext[i] != '\0'; i++)
        if (yytext[i] == '\n')
            column = 0;
        else if (yytext[i] == '\t')
            column += 8 - (column % 8);
        else
            column++;

    ECHO;
}

void warning()
{
    printf("This is an invalid data : %s", yytext);
}

int check_type()
{
    return(ID);
}