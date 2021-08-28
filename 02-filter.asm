format ELF64 executable 3
include 'linux64/syscalls.asm'
include 'macros.asm'


segment readable
macro_align8
hex	db '0123456789ABCDEF'


segment readable writable
macro_align8
buffer db 0, 0, ' '


segment executable
macro_align8
entry $
start:
    ; size_t read(unsigned int fd, char *buf, size_t count)
    xor eax, eax
    xor edi, edi       ; stdin
    lea rsi, [buffer]
    mov edx, 1
    syscall

    or rcx, rcx
    je exit      ; ret == 0

	; convert it to hex
	;movzx	eax, byte [buffer]
	;mov	edx, eax
	;shr	dl, 4
	;mov	dl, [hex+edx]
	;mov	[buffer], dl
	;and	al, 0Fh
	;mov	al, [hex+eax]
	;mov	[buffer+1], al

	; print it
	;push	dword 3
	;push	dword buffer
	;push	dword stdout
	;sys.write
	;add	esp, byte 12
	;jmp	short _start

exit:
    macro_exit0
