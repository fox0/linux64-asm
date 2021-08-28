macro macro_align8 {
    virtual
        align 8
        __align = $ - $$
    end virtual
    db __align dup 0

    __bits = 8
    display '[align0] offset = 0x'
    repeat __bits / 4
        __d = '0' + __align shr (__bits - %*4) and 0x0f
        if __d > '9'
            __d = __d + 'A' - '9' - 1
        end if
        display __d
    end repeat
    display 10 ; \n
}

macro macro_exit0 {
    mov eax, sys_exit
    xor edi, edi
    syscall
}