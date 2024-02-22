%{
#include <stdio.h>
#include <stdlib.h>

#include "parser.h"
%}

%option warn 8bit nodefault noyywrap

DIGIT [0-9]
ID    [A-Z][A-Z0-9]*

%%

"//"[^\n]*      // ignore line comments
"/*"[^*]*"*/"   /* ignore bloc comments */

"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"\n"            { return '\n'; }
"("             { return '('; }
")"             { return ')'; }
"QUIT"          { return QUIT; }

{DIGIT}+        { yylval.value = strtod(yytext, NULL); return VALUE; }
{ID}            { yylval.name = strdup(yytext); return NAME; }
[\t ]*          /* nothing */
.               { fprintf(stderr, "Unknown token: '%s'\n", yytext); ; exit(EXIT_FAILURE); }

%%
