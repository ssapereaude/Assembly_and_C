*-----------------------------------------------------------
* Title      :  practical_06_part5.X68
* Written by :  Temur Rustamov
* Date       :  26/02/2024
* Description:  Conditional Branches and Control Structures
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    MOVE.L  #HEALTH, -(SP)  ; push onto stack
    JSR GAME_LOOP           ; jump to game_loop passing address of health
    BSR HEADS_UP_DISPLAY    ; call heads_up_display subroutine
    BRA END_PROG            ; jump to end of the program    
GAME_LOOP:
    MOVEA.L 4(SP),A1
    SUB.B #10, (A1)         ; substract 10 from health
    RTS
HEADS_UP_DISPLAY:
    LEA MESSAGE, A1         ; load address of message into a1
    MOVE.B #14,D0           ; display null terminated string at a1 without cr,lf
    TRAP #15
    MOVE.B HEALTH, D1       ; load value of health into d1
    MOVE.B #3, D0           ; setting d0 for trap to display number
    TRAP #15                
    RTS
END_PROG:

    SIMHALT             ; halt simulator

* Put variables and constants here
HEALTH: DC.B 100
MESSAGE: DC.B 'HEALTH', 0

    END    START        ; last line of source
                        ; the observations that were made during opening the stack are: stack growth direction, since the stack grows downwards from highet to lower memory address, content changes the content is pushed and popped 


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
