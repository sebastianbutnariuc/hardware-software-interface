; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
    N: dd 7          ; N-th fibonacci number to calculate

section .text
    global main
    extern printf

main:
    mov ecx, DWORD [N]       ; we want to find the N-th fibonacci number; N = ECX = 7
    PRINTF32 `%d\n\x0`, ecx  ; DO NOT REMOVE/MODIFY THIS LINE

    ; TODO: calculate the N-th fibonacci number (f(0) = 0, f(1) = 1)

    cmp ecx, 0
    jz one

    mov eax, 1
    mov ebx, 1
    dec ecx
    
fibo:
    mov edx, eax
    add eax, ebx  
    mov ebx, edx
    dec ecx
    cmp ecx, 1
    jnz fibo
    jmp out

one:
    mov eax, 1
    jmp out

out:
    PRINTF32 `%d\n\x0`, eax
    ret
