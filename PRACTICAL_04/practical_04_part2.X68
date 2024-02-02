*-----------------------------------------------------------
* Title      :  practical_04_part2.X68
* Written by :  Temur Rustamov
* Date       :  02/02/2024
* Description:  Understand and utilise Arithmetic, Logic Operations and BSR and BRA Branching
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    MOVE.B #100, $3000  ; $3000:64 setting the player's health to 100, moved into $3000 (move health to memory location $3000)
    
    MOVE.B #$12, D2     ; D2:00000012 move hex 12 into D2(move location of player into Data Register X first Byte 0 to 15 Y second Byte 0 to 15)
    
    MOVE.B #$22,D3      ; D3:00000022 move hex 22 into D3(move location of npc into Data Register X first Byte 0 to 15 Y second Byte 0 to 15)
    
    ADD.B D2,D3         ; D3:00000034 add contents of D2 to D3 & storing in D3 (bitwise AND D2 and D3 whats new location of player)
    
    LEA $3000, A1       ; A1:00003000 loading efficient address into A1 so A1 points to the memory location where health is stored f.e (load memory address $3000 into address register A1)
    
    SUB.B #20,(A1)      ; $3000:50 substracting from byte at memory address in A1, decreasing health stored at $3000(hit by npc non player character)
    
    ADD.B #10,(A1)      ; $3000:5A adding 10 to byte at memory address in A1 (pickup health found)
                        ; OR operation 
    MOVE.B #$2F, D0     ; load 2F (hex) and then OR operation with 2F & storing into D0
    OR.B   #$2F, D0
    
                        ; NOT operation
    MOVE.B #%11, D1     ; loading 11 (binary) into D1
    NOT.B D1            ; not operation on D1
    
    MOVE.B #10, D2      ; EOR operation
    EOR.B #5, D2        ; Exclusing or operation using 5 on D2
    
                        ; logic instruction such as OR,NOT, EOR mean that OR sets each bit to 1 if any of 2 bits is 1 (based on truth table), not inverts all the bits while exclusive or sets each bit to 1 ONLY if bits from 2 operands are different
                        ; there are direct addressing, indirect addressing, immediate addressing modes, direct addressing - when the operand is part of the instruction, direct addressing is when the operand is a register or memory location and indirect when the operand is specified by a pointer
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
