# Programming Languages - Semantic Applications - Structural Operational Semantics (Small Step)

Author: Engin Tekin

requirements: pyinstaller for Makefile purposes

running: type ./test.sh in order to test script. This will create an executable and tests included in test file

WHILE Language - Abstract Syntax Tree - Parser - Interpreter

This script typed for CSE210A-Programming Languages - Semantic Applications

@Following tutorial has been used during preparation of this code. --- #### https://ruslanspivak.com/lsbasi-part7/ ####

There are four main classes AST, LEXER, PARSER, INTERPRETER

AST: Base Class in order to store Abstract-Syntax Tree

LEXER: This class is created to pass through input and tokenize components.

PARSER: Parser is using tokenized input in order to create Abstract-Syntax Tree (AST)

INTERPRETER: This class accepts an AST and evaluates it. Accepts AST and return new set of commands with state.

Examples:

Input : "x := 3 ; if ( x < 5 ) then x := x + 1 else x := x - 1"

Output:

⇒ skip; if (x<5) then { x := (x+1) } else { x := (x-1) }, {x → 3}
⇒ if (x<5) then { x := (x+1) } else { x := (x-1) }, {x → 3}
⇒ x := (x+1), {x → 3}
⇒ skip, {x → 4}


