# Assembly Playground

Random code snippets I use to learn x86_64 assembly language

## How to compile and run
These are instructions for compiling and running on a Linux x86_64 machine

1) Install `nasm` using your packet manager (e.g. `pacman`, `apt`, etc.)
2) Compile object: `nasm -f elf64 -o filename.o filename.s` - `filename.s` is the input file, `filename.o` will be the generated object file
3) Link object to executable: `ld filename.o -o execname`
4) Run: `./execname`

## Files
- [hello.s](hello.s) - Simple "Hello, world!" script
- [counter.s](counter.s) - Counts from 0 to 9 and prints to stdout. First use of multiple calls and loops 
- [fibonacci.s](fibonacci.s) - Prints Fibonacci numbers from 0 to 10000. Using functions, macros and constants

## Learning resources
Compared to high level languages, Assembly languages seem to have bits and pieces of knowledge very scattered around the web. I haven't found (so far) a very comprehensive learning support, but here are some helpful links I've come across:

- [NASM](https://www.nasm.us/) - The most common x86_64 Assembly compiler for Linux
- [NASM docs](https://www.nasm.us/doc/nasmdoc0.html)
- [x86_64 registers and instructions](https://wiki.cdot.senecacollege.ca/wiki/X86_64_Register_and_Instruction_Quick_Start)
- [Linux System Calls for x86_64](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)
- [Flags registers](https://en.wikipedia.org/wiki/FLAGS_register)
- [NASM Assembly Programming](https://www.tutorialspoint.com/assembly_programming/index.htm)
- [Kupala Assembly YT Series](https://www.youtube.com/watch?v=VQAKkuLL31g&list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn) - great series of Youtube videos covering the basics
- [Just Enough Assembly for Compiler Explorer](https://www.youtube.com/watch?v=soeFwz0cOqU) - another good introduction video
- [NASM Assembly Tutorials](https://asmtutor.com/)
