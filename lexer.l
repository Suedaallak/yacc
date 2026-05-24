%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap

%%
hello      { return HELLO; }
exit       { return EXITCMD; }
print      { return PRINT; }

[a-zA-Z][a-zA-Z0-9]* {
    if(strcmp(yytext, "if") == 0) return IF;
    if(strcmp(yytext, "hello") == 0) return HELLO;
    if(strcmp(yytext, "exit") == 0) return EXITCMD;
    if(strcmp(yytext, "print") == 0) return PRINT;

    yylval.sval = strdup(yytext);
    return ID;
}

[0-9]+(\.[0-9]+)? {
    yylval.fval = atof(yytext);
    return NUMBER;
}

[ \t\r]+   { }

"+"        { return '+'; }
"-"        { return '-'; }
"*"        { return '*'; }
"/"        { return '/'; }
"^"        { return '^'; }
"%"        { return '%'; }
"="        { return '='; }
"("        { return '('; }
")"        { return ')'; }
"++"       { return INC; }
"--"       { return DEC; }

">"        { return GT; }
"<"        { return LT; }
">="       { return GE; }
"<="       { return LE; }
"=="       { return EQ; }
"!="       { return NE; }

"{"        { return '{'; }
"}"	   { return '}'; }

\n { return '\n'; }
.          { }
%%
