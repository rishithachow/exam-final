%{
#include <stdio.h>

void check_phone_number(const char *phone) {
    printf("Verifying phone number: %s... ", phone);
}

%}

%% 

"([0-9]{3}-[0-9]{3}-[0-9]{4}|\\([0-9]{3}\\) [0-9]{3}-[0-9]{4})" {
    check_phone_number(yytext);
    printf("Valid phone number.\n");
}

[^0-9 \n]+ {
    check_phone_number(yytext);
    printf("Invalid phone number: %s (contains non-numeric characters)\n", yytext);
}

[0-9]+ {
    check_phone_number(yytext);
    printf("Invalid phone number: %s (incomplete format)\n", yytext);
}

\n { /* Ignore new lines */ }
.  { /* Ignore other characters */ }

%% 

int main(void) {
    printf("Enter phone numbers (one per line, Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
