; output_array.asm
global output_array
extern printf

SECTION .data
fmtCount:     db "(%ld integers) ", 0
fmtCommaSp:   db ", ", 0
fmtLong:      db "%ld", 0
fmtNL:        db 10, 0

SECTION .text
output_array:
    push rbp              ; entrada: RDI=arr (long*), RSI=count (long)
    mov  rbp, rsp
    push rbx
    sub  rsp, 8           ; alinear para llamadas (rsp%16 = 0)

    mov  rbx, rdi         ; arr
    mov  rcx, rsi         ; count

    ; "(N integers) "
    lea  rdi, [rel fmtCount]
    mov  rsi, rcx
    xor  rax, rax
    call printf

    xor  rdx, rdx         ; idx = 0
.loop:
    cmp  rdx, rcx
    jge  .done
    cmp  rdx, 0
    je   .print_value
    ; ", "
    lea  rdi, [rel fmtCommaSp]
    xor  rax, rax
    call printf
.print_value:
    lea  rdi, [rel fmtLong]
    mov  r8, rdx
    shl  r8, 3            ; offset = idx * 8
    mov  rsi, [rbx + r8]  ; valor long
    xor  rax, rax
    call printf
    inc  rdx
    jmp  .loop

.done:
    lea  rdi, [rel fmtNL]
    xor  rax, rax
    call printf

    add  rsp, 8
    pop  rbx
    pop  rbp
    ret
