*-----------------------------------------------------------
* Title      :  practical_02_part1.X68
* Written by :  Temur Rustamov
* Date       :  22/01/2024
* Description:  part 1
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    
    MOVE.L  #%100, D0   ; 32-bit binary value 100 to the data register D0 (00 00 00 04)
    MOVE.L  #$100, D1   ; 32-bit hexadecimal value 100 to the data register D1 (00 00 01 00)
    MOVE.L  #100,  D2   ; 32-bit decimal value 100 to the data register D2 (00 00 00 64)

    MOVE.L  D0, $3000   ; D0 data (binary 100) to memory location $3000 (00 00 00 04)
    MOVE.L  D1, $3010   ; D1 data (hex 100) to memory location $3010 (00 00 01 00)
    MOVE.L  D2, $3020   ; D2 data (decimal 100) to memory location $3020 (00 00 00 64)        


    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
