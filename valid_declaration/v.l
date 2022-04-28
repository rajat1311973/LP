%{
#include<stdio.h>
#include "y.tab.h"
int linenumber = 1;
%}
%%
"#include" return HDR;
"using namespace std;" return STD;
"main()" return MAIN; 
for return FOR;
"<"|">"|"<="|">="|"&&"|"||" return OP;
"++"|"--" return UOP;
return    return RETURN;
int|float|char|double|void return Dtype;
[a-zA-Z][a-zA-Z0-9]* {yylval.str = yytext; return ID;}
[0-9]+ return num;
[ \t\n] ;
. return yytext[0];
%%
int yywrap()
{
    return 1;
}