#include <stdio.h>
#include <errno.h>
#include "lex.yy.c"

extern FILE *yyin;
extern int yylex(void);
const char *lexUnits[] = {"END",			
						  "INT",			
						  "WHILE",			
						  "FLOAT",			
						  "IF",				
						  "ELSE",			
						  "RETURN",			
						  "STRING_LITERAL", 
						  "ASSIGN",			
						  "ADD",			
						  "BOOL",			
						  "IDENTIFIER",		
						  "AND",			
						  "BVAL",			
						  "CEIL",			
						  "CLPAR",			
						  "COLON",			
						  "COMMA",			
						  "CRPAR",			
						  "DIV",			
						  "DO",				
						  "EQUAL",			
						  "FLOOR",			
						  "FUN",			
						  "GE",				
						  "GT",				
						  "ID",				
						  "IVAL",			
						  "LE",				
						  "MUL",			
						  "NOT",			
						  "OR",				
						  "READ",			
						  "RPAR",			
						  "RVAL",			
						  "SEMICOLON",		
						  "SIZE",			
						  "SLPAR",			
						  "SRPAR",			
						  "SUB",			
						  "THEN",			
						  "VAR",			
						  "LPAR",			
						  "LT",				
						  "BEGINN",			
						  "PRINT",			
						  "REAL"};			

int main()
{
	int tokenValue = 0;
	yyin = fopen("input.csrc", "rt");
	while ((tokenValue = yylex()) != END)
	{
		printf(" --- ID: %d --- Value: %s \n", tokenValue, lexUnits[tokenValue-258]);
	}
}