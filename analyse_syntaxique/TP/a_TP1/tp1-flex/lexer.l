%{
#include <stdio.h>
#include <stdlib.h>
%}

%option warn 8bit nodefault noyywrap

DIGIT    [0-9]
HEXDIGIT [0-9a-fA-F]
LETTER   [a-zA-Z]
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
TURTLE_ID [A-Z][A-Z0-9]*

%%

true      { fprintf(stdout, "Keyword true recognized\n"); }

0|[1-9]{DIGIT}*  { printf("Integer: %s\n", yytext); }
0[xX]{HEXDIGIT}+ { printf("Hexadecimal: %s\n", yytext); }
{DIGIT}+"."{DIGIT}*+([eE][-+]?{DIGIT}+)?|{DIGIT}+[eE][-+]?{DIGIT}+ { printf("Floating point: %s\n", yytext); }
{TURTLE_ID}      { printf("Turtle identifier: %s\n", yytext); }
{IDENTIFIER}     { printf("C identifier: %s\n", yytext); }
[\n\t ]*         /* ignore white space */
.                { fprintf(stderr, "Unknown token: '%s'\n", yytext); exit(EXIT_FAILURE); }

%%