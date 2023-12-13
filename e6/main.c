#include <stdio.h>
#include "y.tab.h"

extern int yyparse();

int main() {
    yyparse();
    return 0;
}

void yyerror(char *s) {
    printf("Erro sintático: %s\n", s);
}