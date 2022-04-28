%{
    #include <stdio.h>
    #include "y.tab.h"
%}

%%
"#include "             {return INCLUDE;}
".h"                    {return INCLUDEEND;}
"int main()"            {return MAINBODY;}
[a-zA-Z0-9]*            {return STATEMENT;}
[<]                     {return OPEN;}
[>]                     {return CLOSE;}
(if|while)" "\(.*\)     {return CONDITION;}
[{]((.|\n)*)[}]         {return BLOCK;}
[\n+]                   {;}

%%
