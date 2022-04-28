%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <ctype.h>
    int n = 0;

    /* array to store the name of variables */
    char symbols[50][50];

    /* function to add new variable */
    void addsymbol(char *symbol);
%}

%union {
    int integer_num;
    char *id;
    double double_num;
}

%start line

%token print INT DOUBLE exit_command
%token <integer_num> integer_number
%token <double_num> double_number
%token <id> ID

%type <num> line exp term
%type <id> assignment

%%

line    : assignment ';'        {;}
        | exit_command ';'      {exit(1);}
        | print exp ';'         {;}
        | line assignment ';'   {;}
        | line print exp ';'    {;}
        | line exit_command ';' {exit(1);}

assignment : INT ID '=' exp     { addsymbol($2); }
           | DOUBLE ID '=' exp  { addsymbol($2); }

exp     : term                  {;}
        | exp '+' term          {;}
        | exp '-' term          {;}

term    : integer_number        {;}
        | double_number         {;}
        | ID                    {;}

%%


void addsymbol(char *symbol)
{
    int f = 0;
    for (int i = 0; i < n; i++)
    {
        int j = 0;
        f = 1;
        while (symbol[j] != '\0' && symbols[i][j] != '\0')
        {
            if (symbols[i][j] != symbol[j])
            {
                f = 0;
                break;
            }
            j++;
        }
        if (symbol[j] == '\0' && symbols[i][j] == '\0')
        {
            yyerror("Variable name is already taken!! ");
            return;
        }
    }
    if (strcmp(symbol, "int") == 0 || strcmp(symbol, "if") == 0 || strcmp(symbol, "char") == 0)
    {
        yyerror("Variable name cannot be a keyword!!");
        return;
    }
    int i = 0;
    while (symbol[i] != '\0')
    {
        symbols[n][i] = symbol[i];
        i++;
    }
    symbols[n][i] = '\0';
    n++;
    yyerror("New variable added");
}

void yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
}

int main(void)
{
    yyparse();
    return 0;
}
