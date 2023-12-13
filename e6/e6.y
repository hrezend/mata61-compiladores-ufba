%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%token ADD ID LPAREN RPAREN EOL

%%
P : E { printf("A análise sintática foi bem-sucedida!\n"); exit(EXIT_SUCCESS); }
E : E ADD T { printf("Regra: E -> E + T\n"); }
  | T { printf("Regra: E -> T\n"); }
  ;
T : ID LPAREN E RPAREN { printf("Regra: T -> id ( E )\n"); }
  | ID { printf("Regra: T -> id\n"); }
  ;
%%

void yyerror(char *s) {
    fprintf(stderr, "Erro sintático: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
