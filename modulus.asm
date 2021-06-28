; returns the remainder of a devision
; 
;	Same thing in C:
;	main() {
;		int r8 = 255;
;		int r9 = 7;
;		return r8 % r9;
;	}
;
; nasm -f elf64 modulus.asm && ld modulus.o -o modulus && ./modulus

section .text
	global _start

_start:
	mov r8, 0xff
	mov r9, 0x7
	jmp modulus

modulus:
	sub r8, r9
	cmp r8, r9
	jg modulus
	jmp exit

exit:
	mov rax, 0x3c
	mov rdi, r9
	syscall
