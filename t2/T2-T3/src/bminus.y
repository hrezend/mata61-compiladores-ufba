%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
extern int yylineno;
extern char *yytext;
void yyerror(char *s, ...){}
%}

%token VOID
%token INTEGER
%token BOOLEAN
%token TRUE
%token FALSE
%token FUNCTION
%token IF
%token ELSE
%token WHILE
%token RETURN
%token PRINT
%token ID
%token NUMBER
%token PLUS
%token MINUS
%token TIMES
%token DIVIDE
%token LT
%token GT
%token OPENP
%token CLOSEP
%token OPENC
%token CLOSEC
%token QUOTE
%token LTE
%token EQ
%token GTE
%token NEQ
%token ERROR
%token COLON
%token SEMICOLON
%token COMMA
%token EQUAL

%start program

%%

program
: declarations
; 

declarations
: declaration 
| declarations declaration 
;

declaration
: func-declaration
| var-declaration
;

type
: INTEGER
| BOOLEAN
;

func-declaration
: ID COLON FUNCTION type OPENP params-declaration CLOSEP EQUAL block
| ID COLON FUNCTION VOID OPENP params-declaration CLOSEP EQUAL block 
;

params-declaration
: /* empty */
| param-declaration-list
;

param-declaration-list
: parameter
| param-declaration-list COMMA parameter
;

parameter
: ID COLON type
;

var-declaration
: ID COLON type SEMICOLON
| ID COLON type EQUAL constant SEMICOLON
;

statements
: statement 
| statements statement 
;

statement 
: if-statement
| while-statement
| return-statement
| print-statement
| assignment-statement
| var-declaration statement
;

if-statement
: IF open-closed-expression statement
| IF open-closed-expression statement ELSE statement
| IF open-closed-expression statement ELSE block
| IF open-closed-expression block
| IF open-closed-expression block ELSE block
| IF open-closed-expression block ELSE statement
;

while-statement
: WHILE open-closed-expression block
| WHILE open-closed-expression statement
;

open-closed-expression
: OPENP expression CLOSEP
;

return-statement
: RETURN expression SEMICOLON
| RETURN SEMICOLON
;

print-statement
: PRINT expression-list SEMICOLON
;

assignment-statement
: ID EQUAL expression SEMICOLON
;

args
: expression 
| args COMMA expression 
;

function-call
: ID OPENP args CLOSEP
| ID OPENP CLOSEP
;

expression-list 
: expression 
| expression-list COMMA expression
;

expression
: constant
| ID
| function-call
| expression PLUS expression 
| expression MINUS expression
| expression TIMES expression
| expression DIVIDE expression
| expression LT final-expression
| expression GT final-expression 
| expression LTE final-expression
| expression GTE final-expression
| expression EQ final-expression
| expression NEQ final-expression
| OPENP expression CLOSEP
;

final-expression
: constant
| ID
| function-call
| final-expression PLUS final-expression 
| final-expression MINUS final-expression
| final-expression TIMES final-expression
| final-expression DIVIDE final-expression
| OPENP final-expression CLOSEP
;

constant
: NUMBER
| TRUE
| FALSE
;

block
: OPENC statements CLOSEC
;

%%

