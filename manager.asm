section .data
    MAX_INTEGERS equ 100
    manager_msg  db "The manager is here to assist you.", 10, 0
    received_msg db "The following integers were received:", 10, 0
    no_input_msg db "Error! No integers were entered, so no largest exists.", 10, 0
    return_msg   db "The manager will now return the count to the driver.", 10, 0
    largest_msg  db "The largest value %ld has been found at index %ld", 10, 0

section .text
    global manager
    extern input_array
    extern output_array
    extern find_largest
    extern printf
    extern fflush

manager:
    push rbp
    mov  rbp, rsp

    ; Announce manager
    lea  rdi, [rel manager_msg]
    xor  rax, rax
    call printf
    xor  rdi, rdi
    call fflush

    sub  rsp, MAX_INTEGERS * 8      ; allocate space for up to 100 longs (800 bytes)

    ; Call input_array to fill the array
    lea  rdi, [rsp]                 ; rdi = pointer to local array
    mov  rsi, MAX_INTEGERS          ; rsi = max number of integers
    call input_array
    mov  rbx, rax                   ; rbx = count of integers entered
    cmp  rbx, 0
    je   .no_input                  ; jump if count == 0

    ; Print message before displaying the array
    lea  rdi, [rel received_msg]
    xor  rax, rax
    call printf
    xor  rdi, rdi
    call fflush

    ; Call output_array to display all entered integers
    lea  rdi, [rsp]
    mov  rsi, rbx
    call output_array
    xor  rdi, rdi
    call fflush

    ; Call find_largest to get index of largest value
    lea  rdi, [rsp]
    mov  rsi, rbx
    call find_largest               ; returns index in rax
    mov  rcx, rax                   ; rcx = index of largest

    ; Load the largest value from the array using the index
    mov  rdx, [rsp + rcx*8]         ; rdx = array[rcx] (the largest value)

    ; Print the largest value and its index
    lea  rdi, [rel largest_msg]
    mov  rsi, rdx                   ; %ld = largest value
    mov  rdx, rcx                   ; %ld = index
    xor  rax, rax
    call printf
    xor  rdi, rdi
    call fflush

    ; Print return message
    lea  rdi, [rel return_msg]
    xor  rax, rax
    call printf
    xor  rdi, rdi
    call fflush

    jmp  .done

.no_input:
    ; No integers entered - print error message
    lea  rdi, [rel no_input_msg]
    xor  rax, rax
    call printf
    xor  rdi, rdi
    call fflush

.done:
    mov  rax, rbx   ; set return value (count of integers)
    mov  rsp, rbp   ; deallocate local array stack space
    pop  rbp
    ret

