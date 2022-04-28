%{
#include<stdio.h>
%}
%token STRUCT ID num VAR_TYPE t_d
%right "="
%start S
%%
   
S         : CHECK {printf("The given syntax of struct in C is accepted\n"); exit(0);}
CHECK     : T_D STRUCT ID '{' DEC '}'Name ';'
	    | STRUCT ID '{' DEC '}' ';'
T_D: t_d
Ar: Name | ID '[' num ']' ';'
DEC :   DEC DEC  
	| VAR_TYPE varlist ';'
	| VAR_TYPE varlist '=' num ';'
	| CHECK
	| VAR_TYPE ID '[' num ']' ';'
	;
Name : | ID
varlist: varlist ',' ID | ID;
%%
void yyerror(const char *str){printf("Invalid syntax\n");}
main() {
    printf("Enter the expression:\n");
    extern FILE *yyin;
    yyin = fopen("A.c","r");
    yyparse();
}      

