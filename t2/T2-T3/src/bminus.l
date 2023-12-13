%option noyywrap yylineno nodefault
%{
#include <stdio.h>
#include <stdlib.h>
#include "bminus.tab.h"

void yyerror(char *s, ...);
%}

%%

"//".*                      { /* no action */ }

void            { return VOID; }
if              { return IF; }
else            { return ELSE; }
boolean         { return BOOLEAN; }
true            { return TRUE; }
false           { return FALSE; }
function        { return FUNCTION; }
integer         { return INTEGER; }
print           { return PRINT; }
return          { return RETURN; }
while           { return WHILE; }

[a-zA-Z][a-zA-Z0-9_]{0,255}   { return ID; }
[0-9]+                        { return NUMBER; } 

"="                           { return EQUAL; }
"+"                           { return PLUS; }
"-"                           { return MINUS; }
"*"                           { return TIMES; }
"/"                           { return DIVIDE; }
"<"                           { return LT; }
">"                           { return GT; }
"("                           { return OPENP; }
")"                           { return CLOSEP; }
"{"                           { return OPENC; }
"}"                           { return CLOSEC; }
"\""                          { return QUOTE; }
":"                           { return COLON; }
";"                           { return SEMICOLON; }
","                           { return COMMA; }

"<="                          { return LTE; }
">="                          { return GTE; }
"=="                          { return EQ; }
"!="                          { return NEQ; }

[ \t\r\n]                     { /* no action */ }
.                             { return ERROR; }

%%