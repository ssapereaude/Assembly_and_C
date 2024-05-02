*-----------------------------------------------------------
* Title      :  practical_06_part1.X68
* Written by :  Temur Rustamov
* Date       :  26/02/2024
* Description:  Conditional Branches and Control Structures
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    ; Move Trap Task to D0
    MOVE.B  #2, D0      ;read string from keyboard and store at (A1), NULL (0) terminated, length returned in D1.W (max 80) 
                        ;D0=00000002 
                        ;Interupt and Trap Task
    TRAP #15            ;pushes the program counter and the status register on the supervisor stack, switches to supervisor mode and the program counter is given a new value taken from one of the sixteen vectors, given by a four bit data value.
                        ;D1=00000001
                        
                    
    LEA     MESSAGE, A1 ;used when writing code that must be independent of the position in the memory , used in the trap statement when you are outputting strings to the screen
                        ;A1=00001012

    MOVE.B  #13, D0     ;Display the NULL terminated string at (A1) with CR, LF.

    TRAP #15
    
    END_PROG:
    
    MESSAGE: DC.B 'Trap Task Test',0    ;directive instructs the assembler to place the following values into memory at the current location, byte data,stores as a NULL terminated string in consecutive bytes 


    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
