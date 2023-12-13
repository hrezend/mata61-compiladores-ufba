%{
#include <stdio.h>
#include <stdlib.h>

int parser_result = 0;
extern int yylineno;

int yylex();
void yyerror(char *s, ...) {}
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
:expression EOL { parser_result = $1; return 0; }
;

expression
: term { $$ = $1; }
| expression PLUS term { $$ = $1 + $3; }
| expression MINUS term { $$ = $1 - $3; }
;

term
: factor { $$ = $1; }
| term TIMES factor { $$ = $1 * $3; }
;

factor
: NUMBER { $$ = $1; }
| OPENP expression CLOSEP { $$ = $2; }
;

%%