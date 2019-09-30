#!/usr/bin/sh
#####
# compiles and runs a NASM script
# input: NASM file with .s extension
##### 
filestem=`echo $1 | cut -d'.' -f1`

nasm -f elf64 $filestem\.s -o $filestem\.o &
ld $filestem\.o -o $filestem
./$filestem

exit 0
