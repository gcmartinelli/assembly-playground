; Counts from 0 to 9 and prints the value to stdout

section .data
    printchr dw 0   ; a value to be printed

section .text
    global _start

_start:
	mov r9, 0 		; counter
    mov r10, 9      ; maximum number of digits to print
    call adder
    mov rax, 60     ; sys_exit
    mov rdi, 0   
    syscall
        
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
    mov rax, 1              ; write syscall
    mov rdi, 1
    mov rdx, 1
    mov rsi, printchr
    syscall
    ret
