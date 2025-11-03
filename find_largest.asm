default rel
extern printf
global find_largest

section .rodata
fmt_largest:     db "The largest value %ld has been found",10,0
fmt_largest_idx: db "The largest value %ld has been found at index %ld",10,0

section .text
; long find_largest(long* a, long n)
find_largest:
    push rbp
    mov  rbp, rsp
    push rbx
    push r12
    push r13
    push r14
    push r15
    sub  rsp, 8              ; <-- align stack to 16 before any call

    mov  rbx, rdi            ; a
    mov  r12, rsi            ; n
    cmp  r12, 1
    jl   .no_data

    mov  r14, [rbx]          ; max value
    xor  r15, r15            ; max index = 0
    mov  r13, 1              ; i = 1
.scan:
    cmp  r13, r12
    jge  .done_scan
    mov  rax, [rbx + r13*8]
    cmp  rax, r14
    jle  .next
    mov  r14, rax
    mov  r15, r13
.next:
    inc  r13
    jmp  .scan

.done_scan:
    lea  rdi, [rel fmt_largest]
    mov  rsi, r14
    xor  rax, rax
    call printf

    lea  rdi, [rel fmt_largest_idx]
    mov  rsi, r14
    mov  rdx, r15
    xor  rax, rax
    call printf

    mov  rax, r14
    jmp  .epilogue

.no_data:
    xor  rax, rax

.epilogue:
    add  rsp, 8              ; <-- restore
    pop  r15
    pop  r14
    pop  r13
    pop  r12
    pop  rbx
    mov  rsp, rbp
    pop  rbp
    ret

