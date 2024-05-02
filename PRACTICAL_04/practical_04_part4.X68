*-----------------------------------------------------------
* Title      :  practical_04_part4.X68
* Written by :  Temur Rustamov
* Date       :  02/02/2024
* Description:  Understand and utilise Arithmetic, Logic Operations and BSR and BRA Branching
*-----------------------------------------------------------
    ORG     $1000
START:                  ; First instruction of the program

; Initialize Data
    MOVE.B  #$64, D0     ; Player Health - 100%

    MOVE.W  #0, D1       ; Player Points

    MOVE.W  #$55, D2     ; Player X Position

    MOVE.W  #$25, D3     ; Player Y Position

    MOVE.B  #$40, D4     ; Boss Health

    MOVE.W  #$33, D5     ; Boss X Position

    MOVE.W  #$44, D6     ; Boss Y Position

; Game Logic
    BSR     IncreasePointsAndHealth

    BSR     PlayerTakesDamage

    BSR     PlayerAttacksBoss

SIMHALT                 ; End of game scenario

; Subroutines
IncreasePointsAndHealth:
    ADD.W   #10, D1      ; increasing points

    ADD.B   #10, D0      ; increasing health

    RTS

PlayerTakesDamage:
    SUB.B   #20, D0      ; decreasing player health 
    RTS

PlayerAttacksBoss:
    SUB.B   #15, D4      ; decrease boss health

    AND.B   #$FF, D0     ; AND 

    OR.B    #$11, D0     ; OR 

    EOR.B   #$FF, D0     ; EOR 

    RTS

    SIMHALT              ; Halt simulator
    
PLAYER_POINTS  dc.w 0    ; 16bits for player points

PLAYER_HEALTH  dc.b 0    ; 8bits for player health

PLAYER_X       dc.w 0    ; 16bits player X position

PLAYER_Y       dc.w 0    ; 16bits for player Y position

BOSS_HEALTH    dc.l 0    ; 32bits for boss health

BOSS_X         dc.w 0    ; 16bits boss X position

BOSS_Y         dc.w 0    ; 16bits boss Y position



    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
