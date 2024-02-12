*-----------------------------------------------------------
* Title      :  practical_05_part4.X68
* Written by :  Temur Rustamov
* Date       :  12/02/2024
* Description:  Understand and utilise Conditional Branches and Control Structures
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
DAMAGE EQU 10           ; constant DAMAGE with 10 (decimal)


START:                
    LEA    MSG_GAME_LOOP, A1 ; effective address of MSG_GAME_LOOP into address register A1
    MOVE.B #3, D0      ; 3 decimal (byte) into D0 (D0=00000003)
    
GAME_LOOP:
    TRAP   #15         ; system call
    DBRA   D0, PLAYER_HEALTH ; decrease D0 and jump  if D0 has not reached -1
    BSR    GAME_OVER   ; jump to subroutine at GAME_OVER
    BRA    GAME_LOOP   ; jump back to GAME_LOOP

PLAYER_HEALTH:
    MOVE.B #5, D0      ; 5 (byte) into D0, (D0 = 00000005)
    SUB.B  D0, PLAYER_HEALTH ; subtract the value in D0 from the memory location PLAYER_HEALTH
    BGE    GAME_LOOP   ; jump if greater than or equal to GAME_LOOP
    
COLLISION_CHECK:
    ADD.B  #1, PLAYER_POSITION ; add 1 (byte) to the memory location PLAYER_POSITION
    RTS                ; return from subroutine
    
COLLISION:
    SUB.B  DAMAGE, PLAYER_HEALTH ; subtract the value defined by DAMAGE from the memory location PLAYER_HEALTH
    RTS                ; return from subroutine

GAME_OVER:
    LEA    MSG_GAME_OVER, A1 ; load effective address of the message MSG_GAME_OVER into A1
    MOVE.B #3, D0      ; 3 (decimal) into D0, (D0 = 00000003)
    TRAP   #15         ; system call
    SIMHALT            ; halt the simulator

PLAYER_POSITION:
    DC.B   10          ; 10 (byte) at PLAYER_POSITION
ENEMY_POSITION:
    DC.B   8           ; 8 (byte) at ENEMY_POSITION
PLAYER_HEALTH:
    DC.B   100         ; 100 (byte) at PLAYER_HEALTH

MSG_GAME_LOOP:
    DC.B   'Game Loop....',0 ; string for game loop message + null terminator
MSG_GAME_OVER:
    DC.B   'Game Over!',0    ; string for game over message + null terminator


* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
