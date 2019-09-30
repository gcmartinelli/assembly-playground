; Counts from 0 to 9 and prints the value to stdout

SYS_EXIT equ 60
SYS_WRITE equ 1
STDOUT equ 1

%macro exit 0
	mov rax, SYS_EXIT
	mov rdx, STDOUT
	syscall
%endmacro


section .data
    printchr dw 0   ; a value to be printed

section .text
    global _start

_start:
	mov r9, 0 		; counter
    mov r10, 9      ; maximum number of digits to print
    call adder
    exit
 
adder:
    add rax, 0x30       ; transform integer to ascii character
    call print          ; print the ascii character for the int
    mov rax, 10         ; set rax to the ascii value of a new line
    call print          ; print the newline char
    mov rax, r9 		; move the counter value to rax
    add rax, 1          ; add one
    mov r9, rax  		; update the counter variable
    cmp r9, r10 		; compare if it is equal or larger than the limit
    jle adder           ; if not, re-do the adder loop
    ret 

print:
    mov [printchr], rax     ; pass whatever is in rax to the print var
    mov rax, SYS_WRITE      ; write syscall
    mov rdi, 1
    mov rdx, STDOUT
    mov rsi, printchr
    syscall
    ret
