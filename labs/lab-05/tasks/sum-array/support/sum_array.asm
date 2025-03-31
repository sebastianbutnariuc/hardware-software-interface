; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

%define ARRAY_SIZE    10

section .data
    byte_array db 8, 19, 12, 3, 6, 200, 128, 19, 78, 102
    word_array dw 1893, 9773, 892, 891, 3921, 8929, 7299, 720, 2590, 28891
    dword_array dd 1392849, 12544, 879923, 8799279, 7202277, 971872, 28789292, 17897892, 12988, 8799201
    dword_array2 dd 1392, 12544, 7992, 6992, 7202, 27187, 28789, 17897, 12988, 17992 ; for squares
    big_numbers_array dd 20000001, 3000000, 3000000, 23456789, 56789123, 123456789, 987654321, 56473829, 87564836, 777777777
    low_bits dd 0
    high_bits dd 0
    ; HINT: define two variables for the big_numbers_sum

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor eax, eax            ; Use eax to store the sum.
    xor edx, edx            ; Store current value in dl; zero entire edx.

add_byte_array_element:
    mov dl, byte [byte_array + ecx - 1]
    add eax, edx
    loop add_byte_array_element ; Decrement ecx, if not zero, add another element.

    PRINTF32 `Array sum is %u\n\x0`, eax

    ; TODO: Compute sum for elements in word_array and dword_array.

    mov ecx, ARRAY_SIZE
    sub eax, eax
    sub ebx, ebx
sum1:
    mov bx, word [word_array + 2 * ecx - 2]
    add eax, ebx
    loop sum1

    PRINTF32 `Array sum is %u\n\x0`, eax

    mov ecx, ARRAY_SIZE
    sub eax, eax
    sub ebx, ebx
sum2:
    mov ebx, dword [dword_array + 4 * ecx - 4]
    add eax, ebx
    loop sum2

    PRINTF32 `Array sum is %u\n\x0`, eax

    ; TODO: Compute the sum of squares for elements in dword_array2

    mov ecx, ARRAY_SIZE
    sub eax, eax
    sub ebx, ebx
    xor esi, esi
sum3:
    mov ebx, dword [dword_array2 + 4 * ecx - 4]
    mov eax, ebx
    mul ebx

    add esi, eax
    loop sum3

    PRINTF32 `Array sum is %u\n\x0`, esi    

    ; TODO: Compute the sum of squares for elements in big_numbers_array

    mov ecx, ARRAY_SIZE
    sub eax, eax
    sub ebx, ebx
    sub edx, edx
sum4:
    mov ebx, dword [big_numbers_array + 4 * ecx - 4]
    mov eax, ebx
    PRINTF32 `inainte %u %u %u %u\n\x0`, ecx, eax, edx, ebx
    mul ebx
    PRINTF32 `alt %u %u %u %u\n\x0`, ecx, eax, edx, ebx
    add dword [low_bits], eax
    jnc continue
    inc dword [high_bits]
continue:
    add dword [high_bits], edx
    loop sum4

    PRINTF32 `Array sum is %llu\n\x0`, [high_bits], [low_bits]
    leave
    ret
