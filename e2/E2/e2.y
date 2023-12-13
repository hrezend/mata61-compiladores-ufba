%{
#include <stdio.h>
#include <stdlib.h>

/* interface to the lexer */
 
extern int yylineno; /* from lexer */
void yyerror(char *s, ...);
int yylex();
%}

/* declare tokens */ 
%token NUMBER
%token ERROR
%token EOL
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token OPENP
%token CLOSEP

%start program

%%
program
    : expr EOL { return 1; }
    ;

expr
    : NUMBER { $$ = $1; }
    | MINUS expr { $$ = -$2; }
    | expr PLUS expr { $$ = $1 + $3; }
    | expr MINUS expr { $$ = $1 - $3; }
    | expr TIMES expr { $$ = $1 * $3; }
    | expr DIV expr { $$ = $1 / $3; }
    | OPENP expr CLOSEP { $$ = $2; }
    | ERROR { return ERROR; }
    ;

%%

