%{
    #include <stdio.h>
    int sign = 0;
    int number = 0;
    char *s = "";
%}

%%

[-+][0-9]+     {
                    number = atoi(yytext);
                    sign = 1;
                }
[0-9]+          {
                    number = atoi(yytext);
                    sign = 0;
                }
.               {
                    s = yytext;
                    sign = -1;
                }

%%

int main(){
    printf("Enter Number :- ");
    yylex();
    if(sign == 1){
        printf("\n%d is Signed Integer\n",number);
    }
    else if(sign == 0){
        printf("\n%d is UnSigned Integer\n",number);
    }
    else{
        printf("\n%s is not an Integer\n",s);
    }
}