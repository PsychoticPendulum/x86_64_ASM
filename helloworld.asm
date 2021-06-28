section .data
	msg:		db		"Hello World!", 0xa
	msg_len:	equ		$-msg

section .text
	global _start

_start:
	mov rax, 0x1		; syscall write
	mov rdi, 0x1		
	mov rsi, msg
	mov rdx, msg_len
	syscall
	jmp exit

exit:
	mov rax, 0x3c		; syscall exit
	mov rdi, 0x0		; exit code
	syscall
