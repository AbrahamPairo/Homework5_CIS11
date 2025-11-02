global output_array
extern printf

section .data
    plural_fmt db "(%ld integers) ", 0
    single_fmt db "(%ld integer) ", 0
    num_fmt    db "%ld", 0
    comma_fmt  db ", ", 0
    nl         db 10, 0

section .text
output_array:
    ; rdi = pointer to array (long*)
    ; rsi = count of integers (long)
    push rbp
    mov  rbp, rsp
    push rbx        ; save callee-saved registers
    push r12
    push r13
    push r14

    mov  r12, rdi   ; r12 = base address of array
    mov  r13, rsi   ; r13 = count of integers

    ; Print the count with correct pluralization in parentheses
    cmp  r13, 1
    jne  .plural
    lea  rdi, [rel single_fmt]      ; use singular format if count == 1
    jmp  .print_count
.plural:
    lea  rdi, [rel plural_fmt]      ; use plural format otherwise
.print_count:
    mov  rsi, r13
    xor  rax, rax
    call printf

    ; If no integers (count == 0), end (though manager avoids calling this in that case)
    test r13, r13
    jz   .done

    ; Print the first integer (no comma before the first number)
    mov  rbx, 0
    mov  r14, [r12 + rbx*8]        ; r14 = array[0]
    lea  rdi, [rel num_fmt]
    mov  rsi, r14
    xor  rax, rax
    call printf
    inc  rbx

.loop:
    cmp  rbx, r13
    jge  .done                     ; loop until rbx == count

    ; Print comma + space separator
    lea  rdi, [rel comma_fmt]
    xor  rax, rax
    call printf

    ; Print the next number
    mov  r14, [r12 + rbx*8]
    lea  rdi, [rel num_fmt]
    mov  rsi, r14
    xor  rax, rax
    call printf

    inc  rbx
    jmp  .loop

.done:
    ; Print newline at end of the line
    lea  rdi, [rel nl]
    xor  rax, rax
    call printf

    ; Restore registers and return
    pop  r14
    pop  r13
    pop  r12
    pop  rbx
    pop  rbp
    ret

