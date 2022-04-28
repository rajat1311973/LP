%{
#include "y.tab.h"
int count=0;
%}
%option yylineno
alpha [a-zA-Z]
digit [0-9]
unary "++"|"--"
%%
"main" {return MAIN_;}
"cout<<" {//printf("returning cout.\n");
	return COUT;}
"cin>>" {return CIN;}
"if"	{return IF;}
"float" {return FLOAT;}
"char"  {return CHAR;}
"void" {return VOID;}
"return" {return RETURN;}
"for"  {return FOR;}
"int"  {return INT;}
"double" {return DOUBLE;}
"else" {return ELSE;}
"true" {return TRUE;}
"struct" {return STRUCT;}
"while" {return WHILE;}
"false" {return FALSE;}
^"#include"<.+(\.h)?> {return INCLUDE;}
^"using namespace std;" {return NAMESPACE;}
[-]?{digit}+ {return NUMBER;}
[-]?{digit}+\.{digit}{1,6} {return FLOAT_NUM;}
[a-zA-Z_]+[a-zA-Z_0-9]*  {return ID;}
{unary} {return UNARY;}
"="     {return ASSIGN;}
"<="	{return LE;}
">="	{return GE;}
"=="	{return EQ;}
"!="	{return NE;}
">" 	{return GT;}
"<"	{return LT;}
"&&"	{return AND;}
"||"	{return OR;}
"+"	{return ADD;}
"-"	{return SUB;}
"/"	{return DIV;}
"*"	{return MUL;}
\/\/.*	{;}
\/\*(.*\n)*.*\*\/    { ; }
[ \t]* {;}
[\n] {count++;}
.	{return *yytext;}
["].*["]	{return STR;}
['].[']         {return CHARACTER;}

%%
int yywrap()
{
	return 1;
}
