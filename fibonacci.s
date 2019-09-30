;;; Prints all Fibonacci numbers from 0 to 10000

; CONSTANTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SYS_WRITE equ 1
SYS_EXIT equ 60
STDIN equ 0
STDOUT equ 1
STDERR equ 2

; MACROS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%macro exit 0
	mov rax, SYS_EXIT
	mov rdi, STDIN
	syscall
%endmacro

%macro printInt 1
	mov bx, %1
	add bx, 0x30
	mov [printstr], bx
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	mov rdx, 1
	mov rsi, printstr
	syscall
%endmacro

%macro printnl 0
	mov bx, 10
	mov [printstr], bx
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	mov rdx, 1
	mov rsi, printstr
	syscall
%endmacro

%macro increment_buffer 0
	mov dx, [buffersize]
	add dx, 1
	mov [buffersize], dx 	; increment the buffer size
%endmacro	

; SECTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .data
	printstr dw 0
	buffersize dw 0
	quotient dw 0

section .text
	global _start

; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_start:
	mov r9w, 0 		; initialize number n1
	mov r10w, 1 		; initialize number n2
	call _main
	exit

_main:
	mov [quotient], r10w
	call _parseint
	call _fibo
	cmp r10w, 10_000
	jle _main
	ret

_fibo:
	push r10w 		; save value of n2
	add r10w, r9w 	; update n2 (n1+n2)
	pop r9w 			; pass old value of n2 to n1
	ret

_parseint:
	mov ax, [quotient]
	mov dx, 0
	mov bx, 10
	div bx 					; divide the integer by 10
	push dx 				; push remainder to the stack
	increment_buffer
		
	mov [quotient], ax 		; update quotient
	cmp ax, 10 				; is the quotient still larger than 10?
	jge _parseint 			; if yes, keep parsing remainders

	cmp ax, 0 				; is it zero?
	je _print_buffer 		; if yes, print the buffer

	push ax 				; if not, add the quotient to the stack
	increment_buffer
	jmp _print_buffer 		; and print the buffer

_print_buffer:
	pop ax
	printInt ax
	mov bx, [buffersize]
	sub bx, 1
	mov [buffersize], bx
	cmp bx, 0
	jg _print_buffer		
	printnl
	ret	
