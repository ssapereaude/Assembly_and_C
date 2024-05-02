; Filename starter.asm

; GLOBALS
global _start ;Declared for linker this is declaring _start (entry point)
section .data
    prompt   db 'Enter number: ', 0
    result   db 'The sum is: ', 0
    crlf     db 0x0D, 0x0A, 0
    intFormat db '%d', 0      ; Format string for integer input/output

section .bss
    numInput resb 11          ; Buffer to hold input number as string (up to 10 digits + null)

section .text
    global _start

_start:
    ; Your main program logic remains unchanged

print_string:  ; RDI = pointer to string
    mov     rax, 1           ; sys_write
    mov     rdi, 1           ; file descriptor 1 = stdout
    mov     rsi, rdi         ; move string pointer to RSI
    mov     rdx, 0
    call    strlen           ; compute string length
    syscall                  ; write string to stdout
    ret

strlen:        ; RSI = string
    xor     rcx, rcx
    not     rcx              ; RCX = -1 (maximum unsigned value)
    xor     al, al           ; NULL byte
    cld                      ; Clear direction flag for string operations
    repne scasb              ; Scan string byte by byte
    not     rcx              ; Number of bytes scanned
    dec     rcx              ; Adjust for off-by-one error
    mov     rax, rcx
    ret

print_int:     ; RDI = integer to print
    mov     rsi, rdi         ; move integer to RSI
    lea     rdi, [intFormat] ; pointer to format string
    lea     rax, [numInput]  ; buffer for snprintf
    mov     rdx, 11          ; size of the buffer
    call    snprintf
    mov     rdi, rax         ; pointer to the formatted string buffer
    call    print_string
    ret

read_int:
    lea     rdi, [numInput]  ; buffer for input
    mov     rsi, 11          ; size of buffer
    call    read_string
    mov     rsi, rdi         ; pointer to buffer
    call    atoi
    ret

read_string:   ; RDI = buffer, RSI = size of buffer
    mov     rax, 0           ; sys_read
    mov     rdi, 0           ; file descriptor 0 = stdin
    syscall                  ; read from stdin
    dec     rax
    mov     byte [rdi+rax], 0 ; Null-terminate the string
    ret

atoi:          ; RSI = string pointer
    xor     rax, rax         ; clear RAX for result
    xor     rcx, rcx         ; clear RCX for sign
    mov     rdx, rsi         ; save pointer for later
atoi_loop:
    mov     dl, byte [rsi]   ; load one byte
    inc     rsi              ; increment string pointer
    cmp     dl, '-'          ; check if negative
    je      atoi_neg
    cmp     dl, '0'          ; check if below '0'
    jb      atoi_done
    cmp     dl, '9'          ; check if above '9'
    ja      atoi_done
    imul    rax, rax, 10     ; multiply result by 10
    sub     dl, '0'          ; convert ASCII to integer
    add     rax, rdx         ; add to result
    jmp     atoi_loop
atoi_neg:
    inc     rcx              ; signal negative number
    jmp     atoi_loop
atoi_done:
    test    rcx, rcx         ; check if negative
    jz      atoi_exit
    neg     rax              ; negate result
atoi_exit:
    ret

snprintf:      ; Simplified version for this context
    xor     rcx, rcx         ; counter for buffer index
snprintf_loop:
    mov     al, [rdi]        ; load format character
    test    al, al           ; check for null terminator
    je      snprintf_done
    mov     [rax+rcx], al    ; write character to buffer
    inc     rcx              ; increment buffer index
    inc     rdi              ; move to next format character
    jmp     snprintf_loop
snprintf_done:
    mov     byte [rax+rcx], 0 ; null terminate
    mov     rax, rsi         ; return pointer to buffer
    ret
