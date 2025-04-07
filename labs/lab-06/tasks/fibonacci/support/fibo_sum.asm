; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
    N dd 1 ; DO NOT MOFIDY THIS LINE EXCEPT FOR THE VALUE OF N!
           ; compute the sum of the first N fibonacci numbers
    sum_print_format db "Sum first %d fibonacci numbers is %d", 10, 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    xor eax, eax     ;store the sum in eax
    xor esi, esi     ;penultimul
    xor edi, edi    ;ultimul
    inc edi     
    mov ecx, [N]
    dec ecx
    cmp ecx, 0
    je end
start_loop:
    add eax, edi
    mov ebx, esi
    mov esi, edi
    add edi, ebx
    loop start_loop
    ; Use the loop instruction
end:
    push eax
    push dword [N]
    push sum_print_format
    call printf
    add esp, 12

    xor eax, eax
    leave
    ret
