; manager.asm
global  manager
extern  input_array
extern  output_array
extern  find_largest

SECTION .data
MAX_INTEGERS  equ 100

SECTION .bss
nums  resq MAX_INTEGERS

SECTION .text
manager:
    push rbp
    mov  rbp, rsp

    ; rdi = &nums   (ADDRESS!), rsi = MAX_INTEGERS
    lea  rdi, [rel nums]      ; <-- NOT  mov rdi, [nums]
    mov  rsi, MAX_INTEGERS
    call input_array          ; rax = count
    mov  rbx, rax             ; save count

    ; output_array(nums, count)
    lea  rdi, [rel nums]
    mov  rsi, rbx
    call output_array

    ; find_largest(nums, count)
    lea  rdi, [rel nums]
    mov  rsi, rbx
    call find_largest         ; rax = largest (ok to ignore/print later)

    mov  rax, rbx             ; return count
    pop  rbp
    ret

