# Analyse Syntaxique | TP n°2 : Bison

[Question du TP (Page 8)](./TP.pdf)

## Question n°10

 > **NAME** est défini dans le fichier ***parser.y*** comme un token. Ce token est utilisé pour identifier des noms (par exemple, des constantes comme "PI") dans l'analyse lexicale réalisée par <ins>**Flex**</ins> (***lexer.l***). Lorsque ***lexer.l*** reconnaît un motif correspondant à NAME, il renvoie ce token à <ins>**Bison**</ins> (***parser.y***) pour l'analyse syntaxique.

## Question n°11

> La directive **%left '+' '-'** dans ***parser.y*** indique à <ins>Bison</ins> que les opérateurs + et - sont associatifs à gauche et ont la même priorité. Cela signifie que dans une expression telle que a - b + c, l'opération est interprétée de gauche à droite, soit (a - b) + c.

## Question n°12

> Oui, l'ordre des directives **%left, %right, et %nonassoc** dans <ins>**Bison**</ins> détermine la priorité des opérateurs. Les opérateurs définis en premier ont une priorité inférieure par rapport à ceux définis après. Dans le contexte de votre exemple, si vous aviez d'autres directives **%left ou %right**, leur ordre relatif déterminerait la priorité des opérateurs concernés.

## Question n°13

```cpp
value: 1.000000
value: 2.000000
add: 3.000000
value: 3.000000
add: 6.000000
value: 4.000000
value: 5.000000
mul: 20.000000
value: 6.000000
mul: 120.000000
add: 126.000000
         +
        / \
       +   *
      /|   |\
     + 3   *  6
    / \   / \
   1   2 4   5

```

## Question n°14

> ajouter cette ligne à ***parser.y*** **> expr** :

```bison
| '(' expr ')' { $$ = $2;}
```

> ajouter ces lignes à ***lexer.l*** :

```flex
"("           { return '('; }
")"           { return ')'; }
```

## Question n°15

> ajouter ces lignes à ***parser.y*** :

```bison
%token QUIT
...
line:
    ...
  | QUIT '\n'       { exit(EXIT_SUCCESS); }
    ...

```

> ajouter ces lignes à ***lexer.l*** :

```flex
"QUIT"        { return QUIT; }
```

## Question n°16

> ajouter ces lignes à ***parser.y*** :

```bison
%right NEG   // Définir la précédence pour le négatif
...
expr:
    ...
  | '-' expr %prec NEG   { $$ = -$2; }
    ...
```

## Question n°17

> ajouter ces lignes à ***lexer.l*** :

```flex
"//"[^\n]*      // ignore line comments
"/*"[^*]*"*/"   /* ignore bloc comments */
```

## Question n°18

> L'ambiguïté de la grammaire réside souvent dans la façon dont les expressions sont analysées, par exemple, l'ambiguïté entre l'associativité et la priorité des opérateurs. Dans votre cas, <ins>**Bison**</ins> gère cette ambiguïté grâce aux directives de priorité (**%left, %right**). Pour rendre la grammaire non-ambiguë, assurez-vous que toutes les règles et priorités sont clairement définies pour éviter toute interprétation multiple d'une même expression. Une grammaire non-ambiguë spécifie clairement l'ordre d'évaluation et l'associativité de chaque opérateur. La solution la plus facile est souvent d'utiliser les directives de précédence de <ins>**Bison**</ins> pour clarifier l'ordre d'opération sans changer la structure de la grammaire fondamentalement.
