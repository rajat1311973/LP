%{
    #include <stdio.h>
    #include "y.tab.h"
    extern yylval;
%}

%%

um[0-9]+    {
                yylval = atoi(yytext);
                return NUMBER;
            }
[0-9]+      {
                yylval = atoi(yytext);
                return NUMBER;
            }
[a-zA-Z]    {
                yylval = *yytext - 'a';
                return ID;
            }
[ \t]       {;}
[\n]        {return 0;}
.           {return yytext[0];} // for - *

%%
