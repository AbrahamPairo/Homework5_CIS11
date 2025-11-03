; stub for regex scan (not compiled)
section .text
    global find_largest
find_largest:
    cmp rax, [rdi]
    ret

