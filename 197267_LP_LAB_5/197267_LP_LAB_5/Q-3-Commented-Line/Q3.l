%{
    #include<stdio.h>
    int double_slash = 0, slash_star = 0, total = 0;
%}

%%

"//".*                  { printf(yytext); double_slash++;}
\/\*(.|[ \n\t])*\*\/    {  
                            printf(yytext);
                            int len = strlen(yytext);
                            for(int i = 0;i < len;i++)
                            {
                                if(yytext[i] == '\n')
                                slash_star++;
                            }
                            slash_star++;
                        }

.                       {printf(yytext);}

%%

void main(){
    extern FILE *yyin;
    yyin = fopen("in.txt", "r");
    yylex();
    printf("\nNo. of Single Commented Line : %d \n",double_slash);
    printf("No. of Multiple Commented Line : %d \n",slash_star);
    total = double_slash + slash_star;
    printf("Total No. of Commented Line : %d \n", total);
}