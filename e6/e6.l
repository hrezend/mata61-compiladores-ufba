%{
#include "y.tab.h"
%}

%%
"+"     { return ADD; }
"id"    { yylval = strdup(yytext); return ID; }
"("     { return LPAREN; }
")"     { return RPAREN; }
\n      { return EOL; }
[ \t]   { /* Ignorar espaços e tabulações */ }
.       { return *yytext; }
%%

int yywrap() {
    return 1;
}
