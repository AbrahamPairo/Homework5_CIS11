; manager.asm
global manager
extern input_array
extern output_array
extern find_largest
extern printf

SECTION .data
MAX_INTEGERS:     dq 100
fmtMgrWelcome:    db "The manager is here to assist you.", 10, 0
fmtNoLargest:     db "Error! No integers were entered, so no largest exists.", 10, 0
fmtBeforeOutput:  db "The following integers were received:", 10, 0
fmtLargestReport: db "The largest value %ld has been found at index %ld", 10, 0
fmtReturn:        db "The manager will now return the count to the driver.", 10, 0

SECTION .text
manager:
    ; Prologue + alineación para llamadas (16B)
    push rbp                    ; (rsp%16 era 8 al entrar) -> 0
    mov  rbp, rsp
    push rbx                    ; -> rsp%16 = 8
    sub  rsp, 808               ; 800 bytes array + 8 de padding -> rsp%16 = 0

    ; Mensaje de bienvenida del manager
    lea  rdi, [rel fmtMgrWelcome]
    xor  rax, rax
    call printf

    ; Llamar a input_array(arr_ptr, MAX_INTEGERS)
    mov  rdi, rsp               ; puntero al array en stack (800 bytes)
    mov  rsi, [rel MAX_INTEGERS]
    call input_array
    mov  rbx, rax               ; RBX = count (preservado)

    cmp  rbx, 0
    je   .no_ints

    ; Aviso antes de mostrar el arreglo
    lea  rdi, [rel fmtBeforeOutput]
    xor  rax, rax
    call printf

    ; Imprimir arreglo
    mov  rdi, rsp               ; arr
    mov  rsi, rbx               ; count
    call output_array

    ; Buscar índice del mayor
    mov  rdi, rsp               ; arr
    mov  rsi, rbx               ; count
    call find_largest           ; RAX = index
    mov  rcx, rax               ; RCX = index

    ; Cargar valor mayor arr[index] (64-bit)
    mov  rdx, rcx
    shl  rdx, 3                 ; *8
    mov  rsi, [rsp + rdx]       ; RSI = valor mayor (long)
    mov  rdx, rcx               ; RDX = índice (long)

    ; Reporte del mayor
    lea  rdi, [rel fmtLargestReport]
    xor  rax, rax
    call printf

    ; Mensaje de retorno al driver
    lea  rdi, [rel fmtReturn]
    xor  rax, rax
    call printf

    ; Return: count
    mov  rax, rbx
    add  rsp, 808
    pop  rbx
    pop  rbp
    ret

.no_ints:
    lea  rdi, [rel fmtNoLargest]
    xor  rax, rax
    call printf
    lea  rdi, [rel fmtReturn]
    xor  rax, rax
    call printf
    mov  rax, rbx               ; 0
    add  rsp, 808
    pop  rbx
    pop  rbp
    ret
