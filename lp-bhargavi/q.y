%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	#include<ctype.h>
	
	extern char *yytext;
	extern int yylineno;
	void yyerror(const char *s);
	int yylex();
	int yywrap();

	int i=0,j=0, type[100];
	char dt[100][100], var[100][100], s[100][100];
	char temp[100],temp1[100],temp2[100];
	void check(int);
	int uflag=0;
%}
%token COUT CIN IF ELSE INT FLOAT CHAR VOID RETURN FOR DOUBLE TRUE FALSE INCLUDE NUMBER FLOAT_NUM  UNARY LE GE LT GT EQ NE ID ADD SUB DIV MUL AND OR STR CHARACTER WHILE MAIN_ STRUCT NAMESPACE ASSIGN

%%
prog : header NAMESPACE struct datatype MAIN_ '(' ')' '{' statements return '}'  {if(uflag==0){printf("Correct syntax.\n");}return 0;}
;

struct : STRUCT ID '{'stats'}' decl 
	|  
	;

decl : ID
     | ID  opt 
     | ';'
     ;

stats : stats stat
	| stat
	;

stat : datatype {strcpy(temp1,yytext);} ID {strcpy(temp2,yytext);} opt ';' { check(1);}
	;                                 

opt : '[' NUMBER ']' 
	|
	;

header : header header
| INCLUDE
;

datatype : INT
| FLOAT
| CHAR
| VOID
| DOUBLE
;

statements :body statements
	| statement ';'  statements
	| statement ';'
	|
	;


body: FOR '(' statement ';' condition ';' statement ')' '{' statements '}'
| WHILE '(' condition ')' '{' statements '}'
| IF '(' condition ')' '{' statements '}' else
| COUT STR ';'
| CIN ID ';'
;

else : ELSE '{' statements '}'
|
;

condition : val relop val
| TRUE
| FALSE
;


statement : datatype {strcpy(temp1,yytext);} ID {strcpy(temp2,yytext);} init  { check(1);}
| ID ASSIGN expression 
| ID relop expression
| ID UNARY
| UNARY ID
;

init : ASSIGN val
|
;

expression : expression arithmetic expression 
| val
;        

arithmetic : ADD
| SUB
| DIV
| MUL
;

relop : LT
| GT
| LE
| GE
| EQ
| NE
;

val : NUMBER
| FLOAT_NUM
| CHARACTER
| ID
;

return : RETURN val ';'
|
;

%%
void check(int type1)
{	
	if(type1==1)
	{
		//printf("%s %s\n",temp1,temp2);
		int flag=0;
		for(int k=0;k<j;k++)
		{
			if((strcmp(dt[k],temp1)==0) && (strcmp(var[k],temp2)==0))
			{ flag=1;
			yyerror(" Variable redeclaration.");
			uflag=1;
			return;}
			if((strcmp(dt[k],temp1)!=0) && (strcmp(var[k],temp2)==0))
			{flag=1; 
			yyerror("Redeclaration of variable. Conflicting datatypes!!"); 
			uflag=1; 
			return ;}

		}
		if(flag==0)
		{ strcpy(dt[j],temp1); strcpy(var[j],temp2); j++; 
		//printf("variable added to list.\n");
		return ;}
	}
	if(type1==2)
	{
		printf("%s\n",temp1);
		int flag=0;
		for(int k=0;k<j;k++)
		{
			if(strcmp(var[k],temp1)==0)
			{ flag=1;break;}
		}
		if(flag==0)
		{
			yyerror("Use of undeclared variable");
		}
	}
} 
int main()
{
	printf("Enter the cpp code:\n");
	yyparse();
}
void yyerror(const char* msg){
	fprintf(stderr,"%s at line number:  %d\n",msg,yylineno);
} 
