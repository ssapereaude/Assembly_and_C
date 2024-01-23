*-----------------------------------------------------------
* Title      :  practical_02_part3.X68
* Written by :  Temur Rustamov
* Date       :  22/01/2024
* Description:  part 3
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here


    MOVE.L #%100, D0            ; 32-bit binary value 100 (4 in hexadecimal) to D0 data register (00 00 00 04)
    MOVE.L #$100, D1            ; 32-bit hexadecimal value 100 to D1 data register (00 00 01 00)
    MOVE.L #100, D2             ; 32-bit decimal value 100 (64 in hexadecimal) to D2 data register (00 00 00 64)

    MOVE.L D0, $3000            ; D0 data (32-bit, 4 in hexadecimal) to memory location $3000 (00 00 00 04)
    MOVE.L D1, $3010            ; D1 data (32-bit, 100 in hexadecimal) to memory location $3010 (00 00 01 00)
    MOVE.L D2, $3020            ; D2 data (32-bit, 64 in hexadecimal) to memory location $3020 (00 00 00 64)

    MOVE.W #100, $3020          ; 16-bit decimal value 100 (64 in hexadecimal) to memory location $3020 (00 64 00 64)
    MOVE.W #$100, $3010         ; 16-bit hexadecimal value 100 to memory location $3010 (01 00 01 00)
    MOVE.W #%100, $3000         ; 16-bit binary value 100 to memory location $3000 (00 04 00 04)

    MOVE.B #100, $3020          ; 8-bit decimal value 100 (64 in hexadecimal) to memory location $3020 (64 64 00 64)
    MOVE.B #$64, $3010          ; 8-bit hexadecimal value 64 to memory location $3010 (64 00 01 00)
    MOVE.B #%10001111, $3000    ; 8-bit binary value 10001111 (8F in hexadecimal) to memory location $3000 (8F 04 00 04)

    SIMHALT                     ; halt simulator

* Put variables and constants here

    END    START                ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
