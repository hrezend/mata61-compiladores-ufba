%option noyywrap yylineno nodefault
%{
#include "blite.tab.h"
%}

%%
\/\/.*$ { /* Ignora Comentarios */ }
[ \t\n\r] { /* Ignora Espaços em Branco */ }

(boolean|else|false|function|if|integer|print|return|string|true|void|while) { return KEY; }
[a-z]+([A-Za-z0-9_]*)? { return ID; }
[0-9]+ { return NUM; }
[+\-*\/%!<>=:;,(){}] { return SYM; }
(<=|>=|==|!=|&&|\|\|) { return SYMC; }
\"([^"\n]|\\n)*\" { return STRING; }

.   	{ return ERROR; }
%%
