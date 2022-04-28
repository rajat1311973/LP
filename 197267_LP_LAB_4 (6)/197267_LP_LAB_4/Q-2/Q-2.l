%{
    #include<stdio.h>
    int key = 0, op = 0, id = 0;
%}

%%
if|while|else|for|do|switch|begin    {printf(yytext);key++;}
"+"|"-"|"*"|"/"|"*="|"&"|"|"|"&&"    {printf(yytext);op++;}
"||"|"^"|"++"|"--"|"<"|">"|">="      {printf(yytext);op++;}
"<="|"<<"|">>"|"="|"/="|"+="|"-="    {printf(yytext);op++;}
[a-zA-Z][a-zA-Z0-9]*                 {printf(yytext);id++;}
[\t\n ]                              {printf(yytext);}
.                                    {printf(yytext);}
%%

int main()
{
    extern FILE *yyin;
    yyin = fopen("in.txt", "r");
    yylex();
    printf("\nkeywords = %d, operators = %d, ids = %d\n",key,op,id);
    return 0;
}