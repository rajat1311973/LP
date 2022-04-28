%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(char *);
%}

%token ZERO ONE

%%

R : S {
    printf("String Accepted\n");
    return 0;
}

S : C
  | ZERO A
  | ONE B

A : C A
  | ZERO

B : C B
  | ONE

C : ZERO
  | ONE

%%

// if we will not reach to R then this will execute
void yyerror(char *err){
    printf("String not Accepted\n");
}

// CFG for string start and end with 0 or 1
// S -> C | 0A | 1B
// A -> CA | 0
// B -> CB | 1
// C -> 0 | 1

int main(){
    printf("Enter string(only with 0 or 1):-\n");
    yyparse();
    return 0;
}