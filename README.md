# Mini Interpreter using Lex & Yacc

##  Overview
This project implements a **mini interpreter** using **Lex (Flex)** and **Yacc (Bison)**.  
It is designed to process mathematical expressions, variables, and simple control structures, demonstrating the fundamentals of compiler design.

The interpreter supports arithmetic operations, variable assignments, increment/decrement operations, and basic conditional execution.

---

##  Objectives
- Design a simple programming language using **Context-Free Grammar (CFG)**
- Implement lexical analysis using **Lex/Flex**
- Implement syntax analysis using **Yacc/Bison**
- Recognize tokens such as identifiers, keywords, and operators
- Evaluate arithmetic expressions
- Manage variables using a symbol table
- Support increment/decrement operations
- Implement simple `if` conditional statements
- Demonstrate integration between lexer and parser
- Run a parser-based interpreter in a Linux environment

---

##  Tools & Environment
- Lex / Flex (Lexical Analyzer)
- Yacc / Bison (Parser Generator)
- GCC Compiler
- C Programming Language
- Linux / Ubuntu (WSL supported)
- Terminal-based execution environment
- AI-assisted development tools (ChatGPT, Gemini)

---

##  Project Structure

| File Name        | Description                          |
|------------------|--------------------------------------|
| lexer.l          | Lexical analyzer definitions         |
| parser.y         | Grammar rules and parser logic       |
| lex.yy.c         | Generated lexer source file          |
| y.tab.c          | Generated parser source file         |
| y.tab.h          | Token definitions from Yacc          |
| calc             | Executable output file               |
| lexer.l.save     | Backup of lexer file                 |
| .bash_history    | Terminal command history             |

---

##  Architecture

The system follows a classical compiler front-end structure:
