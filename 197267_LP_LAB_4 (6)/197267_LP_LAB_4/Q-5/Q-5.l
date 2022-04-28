%{
	#include <stdio.h>
    #include <stdlib.h>
	#include "y.tab.h"
%}


%%

[a-zA-Z0-9]+    {
                    yylval.number = yytext; 
                    return num;
                }

[+*-/]          {
                    return yytext[0];
                }

[\n]            { return L;}
[ \t]           {;}

.               {
                    yyerror("Unexpected Character");
                }

%%

int yywrap(){
    return 1;
}