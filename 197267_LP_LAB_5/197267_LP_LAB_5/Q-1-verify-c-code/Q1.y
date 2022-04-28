%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
    void yyerror(char *);
%}

%start S
%token INCLUDE INCLUDEEND STATEMENT OPEN CLOSE MAINBODY BLOCK CONDITION

%%
S : includes main {printf("The given C code is valid.\n");}

includes : 
         | include includes

include  : INCLUDE OPEN STATEMENT INCLUDEEND CLOSE
main     : MAINBODY blocks
blocks   : BLOCK
         | CONDITION BLOCK
%%

void yyerror(char* s) {
    printf("The given C code is Not valid.\n");
}

int main()
{
	extern FILE *yyin;
    yyin = fopen("example.c", "r");
	yyparse();
	return 0;
}
