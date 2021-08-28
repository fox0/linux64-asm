format ELF64 executable 3
entry _start

include 'linux64.inc'

segment executable
align 8
_start:
    ; mov rax, sys_write
    ; mov rdi, stdout
    ; mov rsi, hello
    ; mov rdx, hello.len
    mov eax, 1
    mov edi, eax
    lea rsi, [hello]
    mov edx, hello.len
    syscall

    ; mov rax, sys_exit
    ; mov rdi, 0
    mov eax, sys_exit
    xor edi, edi
    syscall

segment readable
; align 8
virtual
    align 8
    __align = $ - $$
end virtual
db __align dup 0

hello db "Hello fox", 10  ; \n
.len = $ - hello
