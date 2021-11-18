
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     END = 258,
     INT = 259,
     WHILE = 260,
     FLOAT = 261,
     IF = 262,
     ELSE = 263,
     RETURN = 264,
     STRING_LITERAL = 265,
     ASSIGN = 266,
     ADD = 267,
     BOOL = 268,
     IDENTIFIER = 269,
     AND = 270,
     BVAL = 271,
     CEIL = 272,
     CLPAR = 273,
     COLON = 274,
     COMMA = 275,
     CRPAR = 276,
     DIV = 277,
     DO = 278,
     EQUAL = 279,
     FLOOR = 280,
     FUN = 281,
     GE = 282,
     GT = 283,
     ID = 284,
     IVAL = 285,
     LE = 286,
     MUL = 287,
     NOT = 288,
     OR = 289,
     READ = 290,
     RPAR = 291,
     RVAL = 292,
     REAL = 293,
     PRINT = 294,
     SEMICOLON = 295,
     SIZE = 296,
     SLPAR = 297,
     SRPAR = 298,
     SUB = 299,
     THEN = 300,
     VAR = 301,
     LPAR = 302,
     LT = 303,
     BEGINN = 304
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


