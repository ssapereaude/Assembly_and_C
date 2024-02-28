*-----------------------------------------------------------
* Title      :  practical_06_part3.X68
* Written by :  Temur Rustamov
* Date       :  26/02/2024
* Description:  Conditional Branches and Control Structures
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    LEA $4000, A7               ; initialize sp (a7) to address $4000

    MOVE.B #1, -(A7)            ; push 1 onto the stack

    MOVE.B #2, -(A7)            ; push 2 onto the stack

    MOVE.B #3, -(A7)            ; push 3 onto the stack

    MOVE.B #4, -(A7)            ; push 4 onto the stack


    MOVE.B (A7)+, D1            ; pop the top value 4 off the stack into d1
    MOVE.B (A7)+, D1            ; pop the next value 3 off the stack ubto d1

    MOVE.B (A7)+, D1            ; pop the next value 2 off the stack into d1

    MOVE.B (A7)+, D1            ; pop the next value 1 off the stack into d1


    

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source
                        ; a7 is stack pointer (SP) for keeping track of active subroutines/functionos, parameter passing as pushing parameters onto stack before funciton call and popping them off and register saving since before calling
                        ; subroutine that might alter the current values of some registers that can be saved on the sutck so we can push the content of registers onto stack through a7
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
