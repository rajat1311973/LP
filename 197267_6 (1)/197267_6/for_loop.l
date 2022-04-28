%{
	#include<stdio.h>
	#include "y.tab.h"
%}

DIGIT [0-9]
ALPHA [a-zA-z]

%%
[ \t\n]				{;}
"for"				{return FOR;}
"break"				{return BREAK;}
"continue"			{return CONT;}
"if"				{return IF;}
"else"				{return ELSE;}
"||"				{return OR;}
"&&"				{return AND;}
">="				{return GE;}
"<="				{return LE;}
"!="				{return NE;}
"=="				{return EQ;}
"++"				{return INC;}
"--"				{return DEC;}
{DIGIT}+			{return NUM;}
{ALPHA}({ALPHA}|{DIGIT})*	{return ID;}
.				{return yytext[0];}
%%
