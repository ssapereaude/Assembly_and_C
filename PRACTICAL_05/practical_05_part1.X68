*-----------------------------------------------------------
* Title      :  practical_05_part1.X68
* Written by :  Temur Rustamov
* Date       :  12/02/24
* Description:  Understand and utilise Conditional Branches and Control Structures
*-----------------------------------------------------------

    ORG    $1000         

START:                ; first instruction of program

* Put program code here

INITIALISE:           
    MOVE.B  #3, D0    ; 3 decimal (byte) into D0 D0=00000003
    MOVE.B  #0, D1    ; 0 decimal (byte) into D1 D1=00000000
    
GAME_LOOP:
    CMP.B   #1,D0     ; comparison 1 decimal (byte)vs value in D0, then SR according to the result (Z flag set if equal, C flag if #1 > D0)
    BNE     GAME_POINTS ; jump to GAME_POINTS if the comparison (CMP) result is not equal (Z flag is clear)
    BEQ     GAME_OVER ; jump to GAME_OVER if the comparison (CMP) result is equal (Z flag is set)
    
GAME_POINTS:
    ADD.B   #10,D1    ; add 10 decimal (byte) to the value in D1, then update D1 and change SR (N, Z, V, C flags)
    SUB.B   #1,D0     ; substract 1 decimal (byte) from the value in D0, then update D0, and also change SR (N, Z, V, C flags)
    BRA     GAME_LOOP ; jump back to GAME_LOOP
    
                      ;CMP (Compare): This instruction compares two values and sets the condition codes in the status register based on the result. It's used for conditional branching.
                      ;BNE (Branch if Not Equal): This instruction branches to a specified location if the zero flag (Z) in the status register is not set, meaning the last comparison was not equal.
                      ;BEQ (Branch if Equal): This instruction branches to a specified location if the zero flag (Z) in the status register is set, meaning the last comparison was equal.
                      ;Status Register: Holds flags that are set or cleared by various instructions to indicate the result of an operation (e.g., negative, zero, overflow, carry). It's crucial for conditional operations and managing the flow of the program.
GAME_OVER

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
