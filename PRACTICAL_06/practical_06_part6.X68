*-----------------------------------------------------------
* Title      :  practical_06_part6.X68  
* Written by :  Temur Rustamov
* Date       :  28/02/2024
* Description:   Conditional Branches and Control Structur
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    MOVE.L  #HEALTH, -(SP)   ; NOTE POS IN STACK Moves the value of the label HEALTH to the stack
    MOVE.B  #14, D0          ; 14 into data register D0
    MOVE.B  #14, D1          ; 14 into data register D1
    
    MOVE.L D0, -(SP)    ; PLAYER X the value of D0 to the stack PLAYER X
    MOVE.L D1, -(SP)    ; ENEMY X the value of D1 to the stack ENEMY X
    
    JSR GAME_LOOP        ; to subroutine game_loop
    BSR HEADS_UP_DISPLAY ; to subroutine heads_up_display
    BRA END_GAME        ; ; to label end_game
    
GAME_LOOP:
    MOVE.L 4(SP),D1     ;NOTE DEPTH IN STACK
    MOVE.L 8(SP),D0     ;NOTE DEPTH IN STACK
    
    CMP D0,D1           ; comparison
    BEQ DAMAGE          ; if they are equal
    BRA NO_DAMAGE       ; if no branch to no_damage
    
DAMAGE:
    MOVEA.L 12(SP),A1   ;NOTE IN DEPTH IN STACK
    SUB.B   #10,(A1)    ; 10 from the byte value at the address in A1
NO_DAMAGE:
    RTS                 ; returns from subroutine
HEADS_UP_DISPLAY:
    MOVE.B HEALTH,D1    ; value of the label HEALTH to D1
    MOVE.B #3,D0        ; 3 into D0
    TRAP    #15
    RTS
END_GAME
* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
    HEALTH: DC.B 100    ; variable definition

    END    START        ; last line of source
                        ; we can directly manipulate of the stack pointer (SP) to move around stack: changing the value of A7 f.e by using MOVE & LEA & ADDQ/SUBQ

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
