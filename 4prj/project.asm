; Filename: project.asm

; GLOBALS
global _start

; TEXT SECTION
section .text
_start:
    ; Print first prompt
    mov edx, prompt_length      ; message length
    mov rsi, prompt             ; message address
    mov edi, 1                  ; file descriptor (stdout)
    mov eax, 1                  ; system call number (sys_write)
    syscall                     ; perform system call

    ; Read input into num1
    mov edi, 0                  ; file descriptor (stdin)
    mov eax, 0                  ; system call number (sys_read)
    mov rsi, num1               ; buffer to store input
    mov edx, 64                 ; number of bytes to read
    syscall                     ; perform system call

    ; Convert ASCII to integer (num1)
    mov rsi, num1               ; address of the buffer
    call atoi

    ; Store result in num1 location (overwrite)
    mov [num1], rax

    ; Print second prompt
    mov edx, prompt_length      ; message length
    mov rsi, prompt             ; message address
    mov edi, 1                  ; file descriptor (stdout)
    mov eax, 1                  ; system call number (sys_write)
    syscall                     ; perform system call

    ; Read input into num2
    mov edi, 0                  ; file descriptor (stdin)
    mov eax, 0                  ; system call number (sys_read)
    mov rsi, num2               ; buffer to store input
    mov edx, 64                 ; number of bytes to read
    syscall                     ; perform system call

    ; Convert ASCII to integer (num2)
    mov rsi, num2               ; address of the buffer
    call atoi

    ; Store result in num2 location (overwrite)
    mov [num2], rax

    ; Add num1 and num2, store result in result
    mov rax, [num1]
    add rax, [num2]
    mov [result], rax

    ; Convert integer result to ASCII
    mov rsi, result             ; address to store the ASCII result
    mov rdi, buffer             ; buffer for converted result
    call itoa

    ; Print the result
    mov rdx, [buffer_len]       ; length of the result in ASCII
    mov rsi, buffer             ; result in ASCII
    mov edi, 1                  ; file descriptor (stdout)
    mov eax, 1                  ; system call number (sys_write)
    syscall                     ; perform system call

    ; Exit the program
    mov eax, 60                 ; system call number (sys_exit)
    mov edi, 0                  ; return status
    syscall                     ; perform system call

atoi:
    ; Converts ASCII string to integer. (Simple implementation)
    xor rax, rax                ; clear rax (result)
atoi_loop:
    movzx rcx, byte [rsi]       ; read byte from string
    test rcx, rcx               ; test for null terminator
    jz atoi_done                ; if zero, we are done
    sub rcx, '0'                ; convert from ASCII to integer
    imul rax, rax, 10           ; multiply current result by 10
    add rax, rcx                ; add new digit
    inc rsi                    ; move to the next character
    jmp atoi_loop
atoi_done:
    ret

itoa:
    ; Converts integer to ASCII string. (Simple implementation)
    mov rcx, 10                 ; divisor
    mov rbx, rdi                ; store original buffer address
itoa_loop:
    xor rdx, rdx                ; clear rdx for div
    div rcx                     ; divide rax by 10, result in rax, remainder in rdx
    add dl, '0'                 ; convert remainder to ASCII
    push rdx                    ; push ASCII character onto stack
    test rax, rax               ; test quotient
    jnz itoa_loop               ; repeat if not zero
    ; reverse the string
itoa_build:
    pop rcx                     ; pop character
    mov [rdi], cl               ; store character
    inc rdi                     ; move buffer pointer
    cmp rsp, rbx                ; compare stack pointer with original buffer address
    jne itoa_build              ; continue if more characters
    mov byte [rdi], 0           ; null-terminate string
    mov [buffer_len], rdi       ; calculate length
    sub [buffer_len], rbx       ; adjust length
    ret

; DATA SECTION
section .bss
num1            resb 8                  ; Reserve space for integer (num1)
num2            resb 8                  ; Reserve space for integer (num2)
result          resb 8                  ; Reserve space for result
buffer          resb 21                 ; Buffer for ASCII result, corrected to 21 bytes
buffer_len      resd 1                  ; Reserve space for buffer length

section .data
prompt          db 'Enter Number: ', 0
prompt_length   equ $-prompt
