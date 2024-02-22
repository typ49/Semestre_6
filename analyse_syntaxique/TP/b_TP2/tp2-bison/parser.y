%{
#include <stdio.h>
#include <stdlib.h>
#include "main.h"

int yylex();
void yyerror(const char *);

%}

%debug
%defines

%define parse.error verbose

%union {
  double value;
  const char *name;
}

%token <value>    VALUE       "value"
%token <name>     NAME        "name"
%token            QUIT        "quit"

%left '+' '-'
%left '*' '/'
%right NEG

%type <value> expr

%%

input:
    /* empty */
  | input line
;

line:
    '\n'
  | expr '\n'         { printf("> %.10g\n", $1); }
  | QUIT '\n'         { exit(EXIT_SUCCESS); }
;

expr:
    VALUE               { $$ = $1; printf("value: %f\n", $1);}
  | NAME                { $$ = constant($1); printf("name: %s\n", $1);}
  | expr '+' expr       { $$ = $1 + $3; printf("add: %f\n", $1 + $3);}
  | expr '-' expr       { $$ = $1 - $3;  printf("sub: %f\n", $1 - $3);}
  | expr '*' expr       { $$ = $1 * $3; printf("mul: %f\n", $1 * $3);}
  | expr '/' expr       { $$ = $1 / $3; printf("div: %f\n", $1 / $3);}
  | '-' expr %prec NEG  { $$ = -$2; printf("neg: %f\n", -$2);}
  | '(' expr ')'        { $$ = $2; printf("paren: %f\n", $2);}
;

%%

void yyerror(const char *msg) {
  fprintf(stderr, "%s\n", msg);
}
