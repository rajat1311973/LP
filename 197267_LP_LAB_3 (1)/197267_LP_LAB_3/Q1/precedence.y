%{
    #include<stdio.h>
    void yyerror(char *);
%}

%token NUMBER ID
%start E

%left '-'
%left '*'
%nonassoc UMINUS

%%

E : T {
    printf("Evaluation of Expression :- %d\n", $$);
    return 0;
}

T : T '-' T     {$$ = $1 - $3;}
  | T '*' T     {$$ = $1 * $3;}
  | '-' NUMBER  {$$ = -$2;}
  | '-' ID      {$$ = -$2;}
  | '(' T ')'   {$$ = $2;}
  | NUMBER      {$$ = $1;}
  | ID          {$$ = $1;}

%%

void yyerror(char *s) {
   fprintf(stderr, "%s\n", s);
}

int main(){
    printf("Enter the Expression :- ");
    yyparse();
    return 0;
}