# Simple C-Based Compiler using Flex & Bison

This is a mini compiler project built for educational purposes using **Flex**, **Bison**, and **C**.  
It simulates a simplified programming language that supports basic variable declarations, arithmetic operations, and control structures like `if` and `while`.

---

## 📌 Features

- ✅ Multiple data types: `int`, `float`, and custom `mytype`
- ✅ Arithmetic expressions with `+`, `-`, `*`, `/`
- ✅ Control flow: `if` and `while` statements
- ✅ Custom keywords: `input`, `show`
- ✅ Syntax error detection and handling
- ✅ Reads source code from `program.txt`
- ✅ Auto test all scenarios using `run_all_tests.bat`

---

## 🛠 Technologies Used

| Tool     | Purpose                          |
|----------|----------------------------------|
| **Flex**  | Lexical analysis (tokenizing input)  
| **Bison** | Syntax analysis (parsing grammar)  
| **GCC**   | Compilation  
| **C**     | Logic and semantic actions  
| **VS Code** | Development environment  

---

## ▶️ How to Run

### 🔧 Build the Compiler:

```bash
bison -d parser.y
flex lexer.l
gcc -o output parser.tab.c lex.yy.c main.c

🧪 Run on Single Test:
copy test_cases\test1_valid.txt program.txt
.\output

🔁 Run All Tests Automatically:
.\run_all_tests.bat
📷 Demo Screenshot

![Screenshot 2025-04-14 012623](https://github.com/user-attachments/assets/ff7d8833-3faa-4bef-99d5-f07190840dfa)

🧠 Sample Output
Declared int: a
Declared float: b
Declared mytype: c
Assigned to a
Assigned to b
Input received for c
Output: 15.500000
If executed
While executed

👨‍💻 Author
MD. Abdul Hamim
B.Sc in CSE, Daffodil International University
GitHub: hamim5264




