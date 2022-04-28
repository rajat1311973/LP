%{
    #include<stdio.h>
    #include "y.tab.h"
%}

%%

[a-zA-Z0-9]+    {
                    yylval.str = yytext;
                    return STR;
                }

[ \t\n]         {;}

.               { 
                    return yytext[0];
                }

%%