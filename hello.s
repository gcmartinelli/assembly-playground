; Resources:
; https://www.nasm.us/
; http://heather.cs.ucdavis.edu/~matloff/50/LinuxAssembly.html#tth_sEc3
; http://www.cs.fsu.edu/~langley/CNT5605/2019-Summer/assembly-example/assembly.html
; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
; https://en.wikipedia.org/wiki/Write_(system_call) 

global _start

section .data
	hello_world db 'Hello, world!',10 	;string and the ascii code for a new line (10)

section .text
_start:
	mov rax, 1 				;1 is the syscall code for write. bellow the arguments are set
	mov rdi, 1 				;fd - 0: stdin, 1:stdou, 2:sterr
	mov rsi, hello_world 	;buffer: char array to be written to the file pointed by fd
	mov rdx, 14 			;length: how many bytes of the buffer to write to fd
	syscall 				;runs the syscall set above on %rax

	mov rax, 60 			;60 is the syscall code to Sys_exit. %rdi sets the error code
	mov rdi, 0 				;error code set to 0
	syscall
