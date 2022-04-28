%{
    #include<stdio.h>
    int flag = 0;
    char* sym[10];
    int N = 0;
%}

%token  Dtype num HDR STD RETURN MAIN FOR OP UOP 
%union
{
    char * str;
}
%token <str> ID
%%
stmt : HDR '<' ID '>' STD Dtype MAIN '{' list RETE '}' {printf("\n valid c++ syntax");}
list :
     | Dtype ID '=' num ';' list {char* temp = $2; int flag = 0;for(int i=0;i<N;i++){if(strcmp(temp,sym[i])==0){
         flag = 1;
         break;
     }}
     if(flag)
     {
         yyerror("Redclaration of variable is not allowed");
         exit(0);
     }
     sym[++N] = temp;
     }
     | Dtype I
     ;
I :  ID ';'
    | ID ',' I
    ;

RETE : RETURN num ';' ;
;
%%
extern int linenumber;
void yyerror(char *s)
{
    fprintf(stderr,"Line %d  : %s\n",linenumber,s);
    exit(0);
}

main()
{
    printf("Enter a declaration\n");
    extern FILE *yyin;
    yyin = fopen("c.cpp","r");
    yyparse();
}   
