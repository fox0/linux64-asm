format ELF64 executable 3
include 'linux64/syscalls.asm'
include 'macros.asm'


segment readable
macro_align8
hello db "Hello fox", 10  ; \n
.len = $ - hello


segment executable
macro_align8
entry $
start:
    ; mov rax, sys_write
    ; mov rdi, stdout
    ; mov rsi, hello
    ; mov rdx, hello.len
    mov eax, 1
    mov edi, eax
    lea rsi, [hello]
    mov edx, hello.len
    syscall

exit:
    ; mov rax, sys_exit
    ; mov rdi, 0
    mov eax, sys_exit
    xor edi, edi
    syscall
