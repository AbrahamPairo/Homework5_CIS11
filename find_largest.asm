global find_largest

section .text
find_largest:
    ; rdi = pointer to array (long*)
    ; rsi = count of integers (long)
    push rbp
    mov  rbp, rsp
    push rbx            ; preserve rbx (callee-saved register)

    ; Precondition: rsi (count) >= 1 (manager ensures this)
    xor  rcx, rcx       ; rcx = current index (start at 0)
    mov  rbx, rdi       ; rbx = base address of array
    mov  rdx, rsi       ; rdx = total count
    mov  rax, [rbx]     ; rax = current maximum value (array[0])
    xor  r8, r8         ; r8  = current index of max (0)

.next:
    inc  rcx
    cmp  rcx, rdx
    jge  .done          ; exit loop when index == count

    mov  r9, [rbx + rcx*8]   ; r9 = array[rcx]
    cmp  r9, rax
    jle  .next               ; if current value <= max, continue loop

    mov  rax, r9             ; update current max value
    mov  r8, rcx             ; update index of current max
    jmp  .next

.done:
    mov  rax, r8        ; set return value (index of largest)
    pop  rbx            ; restore rbx
    pop  rbp
    ret

