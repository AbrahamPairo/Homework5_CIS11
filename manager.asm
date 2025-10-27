section .data
MAX_INTEGERS equ 100                 ; Maximum number of integers

section .bss                         ; No global arrays here

section .text
global manager
extern input_array
extern output_array
extern find_largest
extern printf

manager:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 8 * MAX_INTEGERS     ; Reserve space for 100 long integers

    ; --- Print initial message ---
    lea     rdi, [rel msg_manager]
    xor     rax, rax
    call    printf

    ; --- Call input_array(array, MAX_INTEGERS) ---
    lea     rdi, [rbp - 8 * MAX_INTEGERS]   ; Address of array
    mov     rsi, MAX_INTEGERS
    call    input_array
    mov     rbx, rax                        ; Save returned count in RBX

    ; --- If no integers were entered ---
    cmp     rbx, 0
    jne     .has_input
    lea     rdi, [rel msg_no_input]
    xor     rax, rax
    call    printf
    jmp     .return_driver

.has_input:
    ; --- Print the following integers message ---
    lea     rdi, [rel msg_before_output]
    xor     rax, rax
    call    printf

    ; --- Call output_array(array, count) ---
    lea     rdi, [rbp - 8 * MAX_INTEGERS]
    mov     rsi, rbx
    call    output_array

    ; --- Call find_largest(array, count) ---
    lea     rdi, [rbp - 8 * MAX_INTEGERS]
    mov     rsi, rbx
    call    find_largest
    mov     rcx, rax                      ; RCX = index of largest number

    ; --- Load the largest number from array ---
    mov     rax, [rbp - 8 * MAX_INTEGERS + rcx*8]

    ; --- Print the largest value message ---
    lea     rdi, [rel msg_largest]
    mov     rsi, rax                      ; first %ld = value
    mov     rdx, rcx                      ; second %ld = index
    xor     rax, rax
    call    printf

.return_driver:
    ; --- Print return message ---
    lea     rdi, [rel msg_return]
    xor     rax, rax
    call    printf

    ; --- Return count in RAX ---
    mov     rax, rbx
    mov     rsp, rbp
    pop     rbp
    ret


; ----------------------------
; Data section for messages
; ----------------------------
section .rodata
    msg_manager:       db "The manager is here to assist you.", 10, 0
    msg_no_input:      db "Error! No integers were entered, so no largest exists.", 10, 0
    msg_before_output: db "The following integers were received:", 10, 0
    msg_largest:       db "The largest value %ld has been found at index %ld", 10, 0
    msg_return:        db "The manager will now return the count to the driver.", 10, 0

