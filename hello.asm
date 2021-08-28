format ELF64 executable 3
entry _start

hello db "Hello fox", 10  ; \n
.len = $ - hello

_start:
    ; size_t write(unsigned int fd, const char *buf, size_t count)
    mov rax, 1
    mov rdi, 1
    mov rsi, hello
    mov rdx, hello.len
    syscall

    ; void exit(int exit_code)
    mov rax, 60
    mov rdi, 0
    syscall
