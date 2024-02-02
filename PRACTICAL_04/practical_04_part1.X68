*-----------------------------------------------------------
* Title      :  practical_04_part1.X68
* Written by :  Temur Rustamov
* Date       :  02/02/2024
* Description:  Understand and utilise Arithmetic, Logic Operations and BSR and BRA Branching
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    MOVE.B #100, $3000 ;    $3000: 64  byte-sized value 100 into memory location $3000
    
    LEA $3000,A1       ;    A1:00003000 effective address into A1 (load memory address $3000 into address register A1)
    
    SUB.B #20,(A1)     ;    indirect addressing & substracting the byte-sized immediate value from the value located at the memory address pointed to $3000 by A1, results 50 in hex $3000: 50 (hit by NPC non-player character)
    
    ADD.B #10,(A1)     ;    indirect addressing & addition the byte-sized immediate value to the value at the memory location pointed to $3000 by A1, which results in 5A $3000: 5A (pickup health found)
    
                        ;   address registers - for storing memory addresses, point to locations in memory where data can be found/data should be stored

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
