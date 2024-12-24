%{
#include <stdio.h>
%}

%% 

[0-9]+     { printf("Input is a digit: %s\n", yytext); }
[^0-9\n]+  { printf("Input is not a digit: %s\n", yytext); }
\n         { }

%%

int main(void) {
    printf("Enter input (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
