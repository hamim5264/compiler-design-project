%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h> 
%}

digit       [0-9]+
float       [0-9]*\.[0-9]+
id          [a-zA-Z_][a-zA-Z0-9_]*
ws          [ \t]+

%%

"int"           { return INT; }
"float"         { return FLOAT; }
"mytype"        { return MYTYPE; }
"if"            { return IF; }
"while"         { return WHILE; }
"show"          { return SHOW; }
"input"         { return INPUT; }

{float}         { yylval.fval = atof(yytext); return FLOAT_VAL; }
{digit}         { yylval.ival = atoi(yytext); return INT_VAL; }
{id}            { yylval.sval = strdup(yytext); return ID; }

"="             { return ASSIGN; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
";"             { return SEMICOLON; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULT; }
"/"             { return DIV; }

{ws}            { /* ignore whitespace */ }
\n              { return NEWLINE; }
.               { return yytext[0]; }

%%

int yywrap() { return 1; }
