%{
#include <stdio.h>
#include <stdlib.h>
#include "decl.h"
#include "param_list.h"
#include "expr.h"
#include "type.h"
#include "stmt.h"

/* interface to lexer */

extern int yylineno; /* from lexer */
void yyerror(const char *);
int yylex();

struct decl *parser_result;

%}

%token VOID
%token PLUS
%token NUMBER

/* etc */

%%

program
: declarations
; 

declarations
: NUMBER
;

%%

void yyerror(const char *s) {
   fprintf(stderr, "%s\n", s);
}

