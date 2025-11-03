default rel
extern printf
global output_array

section .rodata
fmt_num:    db "%ld",0
fmt_comma:  db ", ",0
fmt_nl:     db 10,0

section .text
; void output_array(long* a, long n)
output_array:
    push rbp
    mov  rbp, rsp
    push rbx
    push r12
    push r13
    sub  rsp, 8              ; <-- align stack to 16 before any call

    mov  rbx, rdi            ; a
    mov  r12, rsi            ; n
    cmp  r12, 0
    jle  .done

    ; print a[0]
    lea  rdi, [rel fmt_num]
    mov  rsi, [rbx]
    xor  rax, rax
    call printf

    mov  r13, 1
.print_loop:
    cmp  r13, r12
    jge  .endline

    lea  rdi, [rel fmt_comma]
    xor  rax, rax
    call printf

    lea  rdi, [rel fmt_num]
    mov  rsi, [rbx + r13*8]
    xor  rax, rax
    call printf

    inc  r13
    jmp  .print_loop

.endline:
    lea  rdi, [rel fmt_nl]
    xor  rax, rax
    call printf

.done:
    add  rsp, 8              ; <-- restore for balanced stack
    pop  r13
    pop  r12
    pop  rbx
    mov  rsp, rbp
    pop  rbp
    ret

