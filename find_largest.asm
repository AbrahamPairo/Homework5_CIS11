; find_largest.asm
global find_largest

SECTION .text
; RDI = arr (long*), RSI = count (long)
find_largest:
    push rbp
    mov  rbp, rsp

    ; maxVal = arr[0]; maxIdx = 0; i = 1;
    mov  rax, [rdi]       ; rax = maxVal (long)
    xor  rdx, rdx         ; rdx = maxIdx = 0
    mov  rcx, 1           ; i = 1

.loop:
    cmp  rcx, rsi
    jge  .done
    mov  r8, [rdi + rcx*8]    ; r8 = arr[i] (long)
    cmp  r8, rax              ; signed compare
    jle  .skip
    mov  rax, r8              ; maxVal = arr[i]
    mov  rdx, rcx             ; maxIdx = i
.skip:
    inc  rcx
    jmp  .loop

.done:
    mov  rax, rdx             ; return index
    pop  rbp
    ret
