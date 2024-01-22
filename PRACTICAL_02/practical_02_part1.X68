*-----------------------------------------------------------
* Title      :  practical_02_part1.X68
* Written by :  Temur Rustamov
* Date       :  22/01/2024
* Description:  part 1
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    MOVE.L  #%100, D0   ; moving the 32-bit 100 (in binary) (4 in hex) to the data register D0
    MOVE.L  #$100, D1   ; moving the 32-bit 100 (in hex) to the data register D1
    MOVE.L  #100,  D2   ; moving the 32-bit 100 (in decimal) (64 in hex) to the data register D2
    
    MOVE.L  D0, $3000   ; moving the 32-bit 4 (in hex) to the memory location $3000 (00 00 00 04)
    MOVE.L  D1, $3010   ; moving the 32-bit 100 (in hex) to the memory location $3010 (00 00 01 00)
    MOVE.L  D2, $3020   ; moving the 32-bit 64 (in hex) to the memory location $3020 (00 00 00 64)

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
