%{
    #include <stdio.h>
%}

%token END 
%token INT 
%token WHILE 
%token FLOAT 
%token IF 
%token ELSE 
%token RETURN 
%token STRING_LITERAL 
%token ASSIGN 
%token ADD 
%token BOOL 
%token IDENTIFIER 
%token AND 
%token BVAL 
%token CEIL 
%token CLPAR 
%token COLON 
%token COMMA 
%token CRPAR 
%token DIV 
%token DO 
%token EQUAL 
%token FLOOR 
%token FUN 
%token GE 
%token GT 
%token ID 
%token IVAL 
%token LE 
%token MUL 
%token NOT 
%token OR 
%token READ 
%token RPAR 
%token RVAL 
%token REAL 
%token PRINT
%token SEMICOLON 
%token SIZE 
%token SLPAR 
%token SRPAR 
%token SUB 
%token THEN 
%token VAR 
%token LPAR 
%token LT 
%token BEGINN


%start prog
%%

prog 
 : block
 ;

block
 : declarations program_body
 ;

declarations
 : declaration SEMICOLON declarations 
 |
 ;

declaration
 : var_declaration
 | fun_declaration
 ;

var_declaration
 : VAR ID array_dimensions COLON type
 ;

type 
 : INT
 | REAL
 | BOOL
 ;

array_dimensions
 : SLPAR expr SRPAR array_dimensions 
 |
 ;

fun_declaration
 : FUN ID param_list COLON type CLPAR fun_block CRPAR
 ;

fun_block
 : declarations fun_body
 ;

param_list
 : LPAR parameters RPAR
 ;

parameters
 : basic_declaration more_parameters 
 |
 ;

more_parameters
 : COMMA basic_declaration more_parameters 
 |
 ;

basic_declaration
 : ID basic_array_dimensions COLON type 
 ;

basic_array_dimensions 
 : SLPAR SRPAR basic_array_dimensions 
 |
 ;

program_body
 : BEGINN prog_stmts END
 ;

fun_body 
 : BEGINN prog_stmts RETURN expr SEMICOLON END
 ;

prog_stmts
 : prog_stmt SEMICOLON prog_stmts 
 |
 ;

 prog_stmt
  : IF expr THEN prog_stmt ELSE prog_stmt
  | WHILE expr DO prog_stmt
  | READ identifier
  | identifier ASSIGN expr
  | PRINT expr
  | CLPAR block CRPAR
  ;

identifier
 : ID array_dimensions
 ;

expr
 : expr OR bint_term
 | bint_term
 ;

bint_term 
 : bint_term AND bint_factor
 | bint_factor
 ;

bint_factor 
 : NOT bint_factor
 | int_expr compare_op int_expr
 | int_expr
 ;

compare_op 
 : EQUAL
 | LT
 | GT
 | LE
 | GE
 ;

int_expr 
 : int_expr addop int_term 
 | int_term
 ;

addop 
 : ADD
 | SUB
 ;

int_term
 : int_term mulop int_factor 
 | int_factor
 ;

mulop
 : MUL
 | DIV
 ;

int_factor
 : LPAR expr RPAR
 | SIZE LPAR ID basic_array_dimensions RPAR
 | FLOAT LPAR expr RPAR
 | FLOOR LPAR expr RPAR
 | CEIL LPAR expr RPAR
 | ID modifier_list
 | IVAL
 | RVAL
 | BVAL
 | SUB int_factor
 ;

modifier_list 
 : LPAR arguments RPAR
 | array_dimensions
 ;

arguments
 : expr more_arguments 
 |
 ;

more_arguments
 : COMMA expr more_arguments 
 |
 ;

prog_stmt
  : IF '(' expr ')' THEN prog_stmt  ELSE prog_stmt 
  | WHILE '(' expr ')' DO prog_stmt
  | IDENTIFIER ASSIGN '(' expr ')'
  | PRINT '(' expr ')'
  ;
%%

void yyerror(char *s)
/* yacc error handler */

{
    printf ("%s\n", s);
} 