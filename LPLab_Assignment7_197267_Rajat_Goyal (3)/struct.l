%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
"\n \t" ;
"struct" return STRUCT;
"int" return VAR_TYPE;
[0-9]+ {return num;}
"typedef" return t_d;
[a-zA-Z]+[a-zA-Z0-9]* return ID;
.    return yytext[0];
%%
