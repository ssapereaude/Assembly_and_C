*-----------------------------------------------------------
* Title      :  practical_03_part4.X68
* Written by :  Temur Rustamov  
* Date       :  29/01/2024
* Description:  Understand and utilise Address Registers
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
* Put program code here

    LEA PLAYER_POINTS, A0   ; A0: address of PLAYER_POINTS
    MOVE.W #%1111, (A0)     ; 15 at the address in A0

    LEA PLAYER_HEALTH, A1   ; A1: address of PLAYER_HEALTH
    MOVE.B #64, (A1)        ; 100% (64 in hex) at the address in A1

    LEA PLAYER_X, A2        ; A2: address of PLAYER_X
    MOVE.W #10, (A2)        ; player pos x 10 at the address in A2

    LEA PLAYER_Y, A3        ; A3: address of PLAYER_Y
    MOVE.W #15, (A3)        ; player pos y 15 at the address in A3

    LEA BOSS_HEALTH, A4     ; A4: address of BOSS_HEALTH
    MOVE.L #99, (A4)        ; boss health 99 at the address in A4

    LEA BOSS_X, A5          ; A5: address of BOSS_X
    MOVE.W #$0000, (A5)     ; boss x pos 0 at the address in A5

    LEA BOSS_Y, A6          ; A6: address of BOSS_Y
    MOVE.W #%10, (A6)       ; boss y pos 2 at the address in A6

    SUB.W #%1111, (A0)      ; -15 points at the address in A0
    SUB.B #10, (A1)         ; player health -10 at the address in A1
    SUB.W #20, (A2)         ; player x pos -20 at the address in A2
    SUB.W #30, (A3)         ; player pos y10 at the address in A3

    SIMHALT                 ; halt simulator

* Put variables and constants here

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
