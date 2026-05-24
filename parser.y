,%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex();

void setVar(char *name, float value);
float getVar(char *name);
float power(float base, int exp);
%}

%union {
    float fval;
    char *sval;
}

%token HELLO
%token EXITCMD
%token PRINT
%token <fval> NUMBER
%token <sval> ID
%token INC DEC
%token IF
%token GT LT GE LE EQ NE

%type <fval> expr term factor cond

%left '+' '-'
%left '*' '/'
%right '^'
%right UMINUS

%%

input:
      input stmt
    | stmt
    ;
stmt:
      HELLO '\n'
        { printf("Hello World!\n"); }

    | expr '\n'
        { printf("Result: %.2f\n", $1); }

    | ID '=' expr '\n'
        {
            setVar($1, $3);
            printf("%s = %.2f\n", $1, $3);
        }
    | PRINT expr '\n'
        {
            printf("%.2f\n", $2);
        }
    | EXITCMD '\n'
        {
            printf("Exiting...\n");
            exit(0);
        }
    | ID INC '\n'
        {
            float val = getVar($1);
            setVar($1, val + 1);
            printf("%s = %.2f\n", $1, val + 1);
        }

    | ID DEC '\n'
        {
            float val = getVar($1);
            setVar($1, val - 1);
            printf("%s = %.2f\n", $1, val - 1);
        }
    | IF '(' cond ')' stmt
        {
            if ($3) {

            }
        }
    | '\n'
    ;
expr:
      expr '+' term { $$ = $1 + $3; }
    | expr '-' term { $$ = $1 - $3; }
    | term          { $$ = $1; }
    ;

term:
      term '*' factor { $$ = $1 * $3; }
    | term '/' factor { $$ = $1 / $3; }
    | term '%' factor { $$ = (int)$1 % (int)$3; }
    | factor          { $$ = $1; }
    ;

factor:
      NUMBER                   { $$ = $1; }
    | ID                       { $$ = getVar($1); }
    | '(' expr ')'             { $$ = $2; }
    | '-' factor %prec UMINUS  { $$ = -$2; }
    | factor '^' factor        { $$ = power($1, (int)$3); }
    ;
cond:
      expr GT expr { $$ = $1 > $3; }
    | expr LT expr { $$ = $1 < $3; }
    | expr GE expr { $$ = $1 >= $3; }
    | expr LE expr { $$ = $1 <= $3; }
    | expr EQ expr { $$ = $1 == $3; }
    | expr NE expr { $$ = $1 != $3; }
    ;
%%

struct variable {
    char name[50];
    float value;
};

struct variable vars[100];
int var_count = 0;

void setVar(char *name, float value) {
    int i;

    for(i = 0; i < var_count; i++) {
        if(strcmp(vars[i].name, name) == 0) {
            vars[i].value = value;
            return;
        }
    }

    strcpy(vars[var_count].name, name);
    vars[var_count].value = value;
    var_count++;
}

float getVar(char *name) {
    int i;

    for(i = 0; i < var_count; i++) {
        if(strcmp(vars[i].name, name) == 0) {
            return vars[i].value;
        }
    }

    printf("Undefined variable: %s\n", name);
    return 0;
}

float power(float base, int exp) {
    int i;
    float result = 1;

    if(exp < 0) {
        exp = -exp;

        for(i = 0; i < exp; i++) {
            result = result * base;
        }

        return 1 / result;
    }

    for(i = 0; i < exp; i++) {
        result = result * base;
    }

    return result;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter input:\n");
    printf("hello, exit, math expressions or single line if statements.\n");
    yyparse();
    return 0;
}
