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


