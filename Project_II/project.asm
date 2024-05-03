; Filename: project.asm
; GLOBALS
global _start ; Declared for linker, this is declaring _start

; TEXT SECTION
section .text
_start:
    ; Print first prompt
    mov rdx, prompt_length      ; message length everything is 64-bit
    mov rsi, prompt             ; message 
    mov rbx, 0x01               ; file descriptor 
    mov rax, 0x01               ; sys call number
    syscall                     ; call kernel 

    ; Read input into num1
    mov rbx, 0x00               ; file descriptor 
    mov rax, 0x00               ; system call number 
    mov rsi, num1               ; move address to store input num1
    syscall

    ; Print second prompt
    mov rdx, prompt_length      ; message length 
    mov rsi, prompt             ; message 
    mov rbx, 0x01               ; file descriptor 
    mov rax, 0x01               ; system call number
    syscall                     ; call kernel 

    ; Read input into num2
    mov rbx, 0x00               ; file descriptor 
    mov rax, 0x00               ; system call number 
    mov rsi, num2               ; move address to store input num2
    syscall

    ; Add num1 and num2, store result in result
    mov rax, [num1]
    add rax, [num2]
    mov [result], rax

    ; Print the result
    mov rdx, 64                 ; length of input num1
    mov rsi, result             ; input num1
    mov rbx, 0x01               ; file descriptor
    mov rax, 0x01               ; system call number 
    syscall

    ; Exit the program
    mov rax, 0x3c               ; system call number 
    mov rdi, 0x0                ; return status 
    syscall                     ; call kernel

; DATA SECTION
section .bss
num1    resb 64                 ; Reserve 64 bits for input num1
num2    resb 64                 ; Reserve 64 bits for input num2
result  resb 64                 ; Reserve 64 bits for result

section .data
prompt          db 'Enter Number -> ',0   ; string to be printed
prompt_length   equ $-prompt             ; length of the string
