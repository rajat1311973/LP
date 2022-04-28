%{
    #include<stdio.h>
    #include "y.tab.h"
    extern yylval;
%}

%%
0   {
        yylval = 0; 
        return ZERO;
    }

1   {
        yylval = 1;
        return ONE;
    }

.|\n {
        yylval = -1;
        return 0;
    }

%%