# find_largest.asm — scan array for largest and report
.intel_syntax noprefix
.global find_largest
.extern printf

.section .rodata
fmt: .asciz "The largest value %ld has been found at index %ld\n"

.section .text
find_largest:
    # args: RDI = long* arr, RSI = long count
    push rbp
    mov  rbp, rsp
    push rbx

    mov  rbx, rdi
    mov  rcx, rsi

    cmp  rcx, 1
    jl   .print_zero

    # max = arr[0], idx = 0
    mov  rax, [rbx]
    xor  rdx, rdx
    xor  r8,  r8
    inc  r8

.loop:
    cmp  r8, rcx
    jge  .print
    mov  r9, [rbx + r8*8]
    cmp  r9, rax
    jle  .next
    mov  rax, r9
    mov  rdx, r8
.next:
    inc  r8
    jmp  .loop

.print:
    lea  rdi, [rel fmt]
    mov  rsi, rax     # largest
    # rdx already index
    xor  eax, eax
    call printf
    pop  rbx
    pop  rbp
    ret

.print_zero:
    # empty or negative count — print 0, index -1
    mov  rax, 0
    mov  rdx, -1
    jmp  .print
