*-----------------------------------------------------------
* Title      :  practical_05_part2.X68
* Written by :  Temur Rustamov
* Date       :  12/02/2024
* Description:  Understand and utilise Conditional Branches and Control Structures
*-----------------------------------------------------------
    ORG    $1000

START:
    LEA PLAYER_POSITION, A1 ; effective address of PLAYER_POSITION into A1
    LEA ENEMY_POSITION, A2 ; effective address of ENEMY_POSITION into A2

    MOVE.B #50, D1 ; immediate value 50 into D1
    MOVE.B #0, D2 ; immediate value 0 into D2

COLLISION_CHECK:
    CMP D2, D1 ; comparison contents D2 vs D1
    BLT NEXT_MOVE ; jump if less than if D2 is less than D1, jump to NEXT_MOVE.
    BEQ COLLISION ; jump if equal if D2 is equal to D1, jump to COLLISION.

NEXT_MOVE:
    ADD.B #1, D2 ; add 1 to D2 contents
    BRA COLLISION_CHECK ; jump back to COLLISION_CHECK 

COLLISION:
    BRA GAME_OVER ; jump to GAME_OVER

GAME_OVER:
* Put program code here
                ;The BEQ instruction stands for "Branch if Equal." It is used to change the flow of execution to a different part of the program if the previous comparison (CMP instruction) found the two compared values to be equal.
                ;Immediate addressing: indicated by the # symbol, used to specify a constant value directly in the instruction (e.g., MOVE.B #50, D1), Direct data register addressing: used when instructions directly reference data registers like D0, D1, D2 (e.g., CMP D2, D1

    SIMHALT             ; halt simulator

PLAYER_POSITION: DC.B 10, 15 ; declaration (byte) PLAYER_POSITION in memory with 2 bytes, 10 and 15
ENEMY_POSITION: DC.B 50, 55 ; declaration (byte) ENEMY_POSITION in memory with two bytes, 50 and 55


* Put variables and constants here

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
