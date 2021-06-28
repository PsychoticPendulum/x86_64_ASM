; prints "Cats Are Great!" to the screen 256 times
; nasm -f elf64 loop.asm && ld loop.o -o loop && ./loop

section .data
	msg:		db		"Cats Are Great!", 0xa
	msg_len:	equ		$-msg

section .text
	global _start

_start:
	mov r8, 0xff		; amount if iterations
	jmp loop			

write:
	mov rax, 0x1		; write syscall
	mov rdi, 0x1		
	mov rsi, msg		; load msg
	mov rdx, msg_len	; load length of msg
	syscall
	ret

loop:
	call write
	sub r8, 0x1			; subtract 1 from r8
	cmp r8, 0x0			; check if r8 = 0
	jnz loop
	jmp exit

exit:
	mov rax, 0x3c		; exit syscall
	mov rdi, 0x0		; return value
	syscall
