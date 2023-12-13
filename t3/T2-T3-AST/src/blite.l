%option noyywrap yylineno nodefault
%{
#include "blite.tab.h"
%}

%%

"//".*                      { /* no action */ }

void            { return VOID; }

[0-9]+           { return NUMBER; }

"+"		 { return PLUS; }

%%

