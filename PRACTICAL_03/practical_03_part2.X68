*-----------------------------------------------------------
* Title      :  practical_03_part2.X68
* Written by :  Temur Rustamov
* Date       :  29/01/2024
* Description:  Understand and utilise Address Registers
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    LEA $4000, A2       ; A2: 00004000
    MOVE.B #100, (A2)   ; $4000: 64 FF FF FF
    SUB.B #10, (A2)     ; $4000: 5A FF FF FF
                        ; SUB - Substract binary (SUBI or SUBQ used when source is #n, Prevent SUBQ with #n.L)

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
