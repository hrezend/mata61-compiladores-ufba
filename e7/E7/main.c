#include <stdio.h> 
#include <stdlib.h> 
#include "e7.tab.h"

int yyparse();
extern int parser_result;

int main(){
    if (!yyparse()) { // Se não deu erro sintático, ou seja yyparse() retornou 0
        fprintf(stdout,"%d\n", parser_result);
    }
    else {
        fprintf(stdout, "syntax error\n");
    }
	
    exit(0);
}
