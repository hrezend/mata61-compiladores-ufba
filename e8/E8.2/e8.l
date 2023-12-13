%option noyywrap nodefault yylineno
%{
#include <stdlib.h>
#include "e8.tab.h"

void yyerror(char *s, ...);
%}

%%
"+" 	{ return PLUS; } 
"-" 	{ return MINUS; } 
"*" 	{ return TIMES; }
"/"     { return DIVISION; }
"(" 	{ return OPENP; } 
")" 	{ return CLOSEP; } 
[0-9]+ 	{ yylval = atoi(yytext); return NUMBER; } 
[ \t] 	{ /* ignore white space */ } 
\n      { return EOL; } 
.   	{ return ERROR; } 
%%
