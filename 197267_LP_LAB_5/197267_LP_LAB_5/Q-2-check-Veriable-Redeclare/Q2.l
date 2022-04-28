%{
    #include <stdio.h>
    #include "y.tab.h"
    char *ptr;
    int l = 0;
%}

%%
"print"                 {return print;}
"exit"                  {return exit_command;}
"int"                   {return INT;}
"double"                {return DOUBLE;}

[a-zA-Z]+               {
                            l = 0;
                            for (int i = 0; yytext[i] != '\0'; i++)
                            {
                                l++;
                            }
                            yylval.id = (char *)malloc((l + 1) * sizeof(char));
                            for (int i = 0; yytext[i] != '\0'; i++)
                            {
                                yylval.id[i] = yytext[i];
                            }
                            yylval.id[l] = '\0';
                            return ID;
                        }

[-+]?[0-9]+             {
                            yylval.integer_num = atoi(yytext);
                            return integer_number;
                        }
[-+]?[0-9]+\.[0-9]+     {
                            yylval.double_num = strtod(yytext, &ptr);
                            return double_number;
                        }
[ \t\n]                 {;}
[-+=;]                  {return yytext[0];}
.                       {;}

%%
