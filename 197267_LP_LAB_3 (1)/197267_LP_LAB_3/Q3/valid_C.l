%{
    #include<stdio.h>
    int count;
%}

%%

[ \t\n]                             {;} /*ignore the white spaces*/
if|else|int|struct|case|enum|default   { printf("%s : is a valid C keyword\n", yytext);}
[a-zA-Z]+                           { printf("%s : is Not a valid C keyword\n", yytext);}
.                                   {;}

%%

int main(){
    printf("Enter a word :- ");
    yylex();
}