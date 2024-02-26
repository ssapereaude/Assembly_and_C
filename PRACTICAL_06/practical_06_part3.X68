*-----------------------------------------------------------
* Title      :  practical_06_part3.X68
* Written by :  Temur Rustamov
* Date       :  26/02/2024
* Description:  Conditional Branches and Control Structures
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    LEA $4000, A7
    
    MOVE.B #1, -(A7)
    MOVE.B #2, -(A7)
    MOVE.B #3, -(A7)
    MOVE.B #4, -(A7)
    
    MOVE.B (A7)+,D1
    MOVE.B (A7)+,D1
    MOVE.B (A7)+,D1
    MOVE.B (A7)+,D1
    
                        ;A7 is a stack-pointer, works differently compared to A0-A6, but
                        ;it doesn't really. You could use A6 as stack pointer,
                        ;except that all ROM routines and the CPU itself ( see bsr and jsr ) use A7 as the SP so it wouldn't be a good idea,must be an even number  
END:

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
