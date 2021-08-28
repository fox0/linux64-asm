format ELF64 executable 3
entry _start

hello db "Hello fox", 10  ; \n
.len = $ - hello

_start:
    mov edx, hello.len
    mov ecx, hello
    mov ebx, 1
    mov eax, 4

    int 0x80
    mov ebx, 0
    mov eax, 1
    int 0x80
