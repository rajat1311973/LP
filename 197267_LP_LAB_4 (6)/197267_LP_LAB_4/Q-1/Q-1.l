%{
    #include<stdio.h>
    char *units[20] = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight",
        "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
        "sixteen", "seventeen", "eighteen", "nineteen",
    };
    char *tens[10] = {"", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
    char *scale = "hundred";
    int num = 0;
    void convert(char *);
%}

%%
[a-z]+      {convert(yytext);}
.     {;}
%%

void convert(char *wrd){
    for(int i = 0; i < 20;i++){
        if(strcmp(units[i], wrd) == 0){
            num += i;
        }
    }
    for(int i = 0;i < 10; i++){
        if(strcmp(tens[i],wrd) == 0){
            num += (i)*10;
        }
    }
    if(strcmp(scale,wrd) == 0){
        num *= 100;
    }
}

int main(){
    printf("Enter number(In Words) :-\n");
    yylex();
    printf("Numeric Value : %d\n",num);
}
