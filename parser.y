%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    int ival;
    float fval;
    char* sval;
}

/* Declare token types along with their union member */
%token <ival> INT_VAL
%token <fval> FLOAT_VAL
%token <sval> ID

%token INT FLOAT MYTYPE IF WHILE SHOW INPUT
%token ASSIGN PLUS MINUS MULT DIV
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON NEWLINE

/* Declare the type for nonterminals */
%type <fval> expression

%%

program:
      program statement
    | program NEWLINE         
    | /* empty */
    ;


statement:
      declaration
    | assignment
    | input_stmt
    | output_stmt
    | if_stmt
    | while_stmt
    ;

declaration:
      INT ID SEMICOLON     { printf("Declared int: %s\n", $2); }
    | FLOAT ID SEMICOLON   { printf("Declared float: %s\n", $2); }
    | MYTYPE ID SEMICOLON  { printf("Declared mytype: %s\n", $2); }
    ;

assignment:
    ID ASSIGN expression SEMICOLON { printf("Assigned to %s\n", $1); }
    ;

expression:
      INT_VAL        { $$ = (float)$1; }
    | FLOAT_VAL      { $$ = $1; }
    | ID             { $$ = 0.0; }  /* placeholder */
    | expression PLUS expression   { $$ = $1 + $3; }
    | expression MINUS expression  { $$ = $1 - $3; }
    | expression MULT expression   { $$ = $1 * $3; }
    | expression DIV expression    { $$ = $1 / $3; }
    ;

input_stmt:
    INPUT ID SEMICOLON { printf("Input received for %s\n", $2); }
    ;

output_stmt:
    SHOW expression SEMICOLON { printf("Output: %f\n", $2); }
    ;

if_stmt:
    IF LPAREN expression RPAREN LBRACE program RBRACE { printf("If executed\n"); }
    ;

while_stmt:
    WHILE LPAREN expression RPAREN LBRACE program RBRACE { printf("While executed\n"); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}
