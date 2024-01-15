*-----------------------------------------------------------
* Title      :  part3
* Written by :  Temur Rustamov
* Date       :  15/01/2024
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    MOVE.B #$64,D1
    LEA text, A1
    MOVE #14,D0
    TRAP #15

    MOVE #3,D0
    TRAP #15
    
    SIMHALT

text  dc.b 'Data Register: ',0

    END     START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
