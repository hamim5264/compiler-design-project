#include <stdio.h>

extern FILE *yyin;
int yyparse();

int main() {
    yyin = fopen("program.txt", "r");
    if (!yyin) {
        perror("Error opening input file");
        return 1;
    }

    printf("🔍 Parsing program.txt...\n\n");
    yyparse();

    fclose(yyin);
    return 0;
}
