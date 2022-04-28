%{
    #include<stdio.h>
    void yyerror(char *);
%}

%union {
    char *number;
}

%start S
%token <number> num
%token L

%%

S :
  | S E L                  {return 0;}

E : E '+' T             {printf("+ ");}
  | E '-' T             {printf("- ");}
  | T                   {;}

T : T '*' F             {printf("* ");}
  | T '/' F             {printf("/ ");}
  | F                   {;}

F : num                 {printf("%s ", $1);}

%%

void yyerror(char *s){
    fprintf(stderr, "%s\n", s);
}

int main(){
    printf("Enter Infix Expression:-\n");
    yyparse();
    printf("\n");
    return 0;
}

