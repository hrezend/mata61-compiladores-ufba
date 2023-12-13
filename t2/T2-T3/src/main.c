#include <stdio.h> 
#include <stdlib.h> 
#include "bminus.tab.h"

extern int yyparse();

int main() {
    if (!yyparse()){
        printf("no syntax error\n");
    }
    else {
        printf("syntax error\n");
    }
}