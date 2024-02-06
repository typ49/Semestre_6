%{
#include <stdio.h>
#include <stdlib.h>
%}

%option warn 8bit nodefault noyywrap

DIGIT    [0-9]

%%

{DIGIT}+  { printf("Number: %i (%s)\n", atoi(yytext), yytext); }
[\n\t ]*  /* nothing */
.         { fprintf(stderr, "Unknown token: '%s'\n", yytext); ; exit(EXIT_FAILURE); }

%%
