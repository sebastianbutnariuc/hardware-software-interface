%include "printf32.asm"

%define NUM 5

section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every "push" instruction by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    mov ecx, NUM
push_nums:
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    sub esp, 4
    mov dword [esp], 0
    mov esi, "corn"
    sub esp, 4
    mov [esp], esi
    mov esi, "has "
    sub esp, 4
    mov [esp], esi
    mov esi, "Bob "
    sub esp, 4
    mov [esp], esi

    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above
    mov eax, ebp
do:
    PRINTF32 `0x%x: 0x%x\n\x0`, eax, [eax]
    sub eax, 4
    cmp eax, esp
    jge do
out:

    ; TODO 3: print the string
    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi

    ; TODO 4: print the array on the stack, element by element.
    pop edi
    pop edi
    pop edi
    pop edi
    mov ecx, NUM
start:
    pop eax
    PRINTF32 `%d \x0`, eax
    loop start
    PRINTF32 `\n\x0`
    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
