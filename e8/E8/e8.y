%{
#include <stdio.h>
#include <stdlib.h>
#include "ast.h"
#include "ast.c"
#define YYSTYPE struct expr *

int yylex(); 
extern int yylineno;
extern char *yytext;
void yyerror(char *s, ...) {}
struct expr * parser_result = 0;
%}

%token NUMBER
%token ERROR
%token EOL
%token PLUS
%token MINUS
%token TIMES
%token OPENP
%token CLOSEP

%start program

%%
program
: expr EOL { parser_result = $1; return 0; }
;

expr
: expr PLUS term { $$ = expr_create(EXPR_ADD, $1, $3); }
| expr MINUS term { $$ = expr_create(EXPR_SUBTRACT, $1, $3); }
| term { $$ = $1; }
;

term
: term TIMES factor { $$ = expr_create(EXPR_MULTIPLY, $1, $3); }
| factor { $$ = $1; }
;

factor
: NUMBER { $$ = expr_create_value(atoi(yytext)); }
| OPENP expr CLOSEP { $$ = $2; }
;

%%

