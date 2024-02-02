*-----------------------------------------------------------
* Title      :  practical_04_part3.X68  
* Written by :  Temur Rustamov
* Date       :  02/02/2024
* Description:  Understand and utilise Arithmetic, Logic Operations and BSR and BRA Branching
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    MOVE.B #100, $3000  ; $3000:64 setting the player's health to 100, moved into $3000 (move health to memory location $3000)
    
    LEA $3000, A1       ; A1:00003000 loading $3000 into A1, pointing to player's health (load memory address $3000 into address register A1)

    BSR TAKING_DAMAGE   ; branch to subroutine so the program jumps to TAKING_DAMAGE subroutine, then it will be executed from here until RTS is processed(branch to TAKING_DAMAGE) 
    
BACK_IN_THE_GAME:       ; return point after taking damage, marker
    BSR HEALTH_PICKUP   ; after taking damage and returning to BACK_IN_THE_GAME so the program branches to HEALTH_PICKUP subroutine(lets help this player out)
    BSR GAME_END        ; called immediately after picking up health, the end of the game since the player's health set to 0
    
TAKING_DAMAGE:          ; player's health decreased by 20 to show taking damage from NPC, then it branches back to BACK_IN_THE_GAME 
    SUB.B #20,(A1)      ; indirect addressing & substraction (hit by NPC & non-player character)
    BRA BACK_IN_THE_GAME
    
HEALTH_PICKUP:          ; add 10 to player's current health, so it would look like picking up a health item, after that, returns to the calling instruction by RTS
    ADD.B   #10,(A1)    ; indirect addressing & addition (pickup health found)
    RTS
    
GAME_END:
    MOVE.B #$00,(A1)    ; indirect addressing (game over)
    
                        ; bra - jumps to specified location in the code (loops & conditional execution path)
                        ; bsr - calls a subroutine, used for executing reusable code blocks & organizing code into functions for maintability



    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
