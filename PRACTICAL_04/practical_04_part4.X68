*-----------------------------------------------------------
* Title      :  practical_04_part4.X68
* Written by :  Temur Rustamov
* Date       :  02/02/2024
* Description:  Understand and utilise Arithmetic, Logic Operations and BSR and BRA Branching
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

; Initialize Data
    MOVE.B #$64, D0      ; 100% for player health

    MOVE.B #0, D1        ; 0 

    MOVE.B #$10, D2      ; Player X Position

    MOVE.B #$20, D3      ; Player Y Position

    MOVE.B #$80, D4      ; Boss Health

    MOVE.B #$30, D5      ; Boss X Position

    MOVE.B #$40, D6      ; Boss Y Position


; Player finds an item
    BSR IncreasePointsAndHealth


; Player takes damage from a trap
    BSR PlayerTakesDamage


; Player attacks the boss
    BSR PlayerAttacksBoss


SIMHALT             ; End of game scenario

; Subroutines
IncreasePointsAndHealth:
    ADD.W #10, D1    ; Increase points
    ADD.B #10, D0    ; Increase health
    RTS

PlayerTakesDamage:
    SUB.B #20, D0    ; Decrease player health due to trap
    RTS

PlayerAttacksBoss:
    SUB.B #15, D4    ; Decrease boss health
    EOR.B #$FF, D0   ; EOR operation as an example, not typical for health
    RTS


    SIMHALT             ; halt simulator
    
PLAYER_POINTS  dc.w 0    ; 16bits for player points
PLAYER_HEALTH  dc.b 0    ; 8bits for player health
PLAYER_X       dc.w 0    ; 16bits player X position
PLAYER_Y       dc.w 0    ; 16bits for player Y position
BOSS_HEALTH    dc.l 0    ; 32bits for boss health
BOSS_X         dc.w 0    ; 16bits boss X position
BOSS_Y         dc.w 0    ; 16bits boss Y position

                         ;                        ; there are direct addressing, indirect addressing, immediate addressing modes, direct addressing - when the operand is part of the instruction, direct addressing is when the operand is a register or memory location and indirect when the operand is specified by a pointer
* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
