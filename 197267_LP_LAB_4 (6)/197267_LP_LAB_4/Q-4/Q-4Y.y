%{
    #include<stdio.h>
    void yyerror(char *);
%}

//When using lex, we put the value into yylval
//  In complex situations yylval is a union
%union {
    char *str;
}

%token <str> STR
%type <str> E
%start S

%%

S : E {
        int n = strlen($1);
        for(int i = 0; i < n/2; i++){
            if($1[i] != $1[n-i-1]){
                printf("%s is not palindrom\n",$1);
                return 0;
            }
        }
        printf("%s is palindrom\n",$1);
        return 0;
    }

E : STR {$$ = $1;}

%%

void yyerror(char *err){
    fprintf(stderr,"%s\n",err);
}

int main(){
    printf("Enter String :-\n");
    yyparse();
    return 0;
}