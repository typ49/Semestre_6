%{
#include "turtle-parser.h"
%}

%%

forward  { return KW_FORWARD; }
right    { return KW_RIGHT; }
left     { return KW_LEFT; }
penup    { return KW_PENUP; }
pendown  { return KW_PENDOWN; }
[0-9]+(\.[0-9]+)? { yylval.value = atof(yytext); return VALUE; }

[\t\n ]+ ; /* Ignore whitespace */
. { printf("Unexpected character: %s\n", yytext); }

%%
