; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE STRING IN QUOTES
substring: db "BABC", 0 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE STRING IN QUOTES

print_format: db "Substring found at index: %d", 10, 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    ; TODO: Print the start indices for all occurrences of the substring in source_text
    xor edx, edx ;bool
    xor ecx, ecx ;parcurgere sir mare
parcurgere:
    mov al, [substring]
    cmp byte [source_text + ecx], al
    jne continue
avem_sub:
    inc ecx
    cmp byte [source_text + ecx], 0
    je afara
    xor ebx, ebx
    inc ebx
    mov al, [substring + ebx]
    cmp al, 0
    jne mai_cauta
    inc edx
    PRINTF32 '%d\n\x0', ecx
    jmp continue
mai_cauta:
    cmp byte [source_text + ecx], al
    jne continue
    jmp avem_sub
continue:
    inc ecx
    cmp byte [source_text + ecx], 0
    jne parcurgere
afara:

    leave
    ret
