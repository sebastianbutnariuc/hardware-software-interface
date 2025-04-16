%include "printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:
    push ebp
    mov ebp, esp
    ; TODO push the elements of the array on the stack
    ; TODO retrieve the elements (pop) from the stack into the output array

    mov ecx, ARRAY_LEN
push_array:
    push dword [input + 4 * (ecx - 1)]
    loop push_array

    mov ecx, ARRAY_LEN
pop_array:
    pop dword [output + (ecx - 1) * 4]
    loop pop_array

    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx
print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
