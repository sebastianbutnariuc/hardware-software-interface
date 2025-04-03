; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

%define ARRAY_SIZE    10

section .data
    dword_array dd 1392, 12544, 7991, 6992, 7202, 27187, 28789, 17897, 12988, 17992

section .text
extern printf
global main
main:
    mov ecx, ARRAY_SIZE
    xor ebx, ebx
    xor edx, edx
start:
    xor eax, eax
    inc eax
    and eax, [dword_array + 4 * ecx - 4]
    cmp eax, 0
    jne else
    inc ebx
    jmp end_label
else:
    inc edx
end_label:
    loop start

    PRINTF32 `Num even is %u, num odd is %u\n\x0`, ebx, edx

    ret
