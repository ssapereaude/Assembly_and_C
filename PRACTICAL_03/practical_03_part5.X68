*-----------------------------------------------------------
* Title      :  practical_03_part5.X68
* Written by :  Temur Rustamov
* Date       :  29/01/2024
* Description:  Array and traversing an Array
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    MOVEA.L #ACHIEVEMENT_POINTS, A1 ; A1:00001020 we moving the address of the label/named address into address register A1 
    MOVE.L #0, D0                   ; D0:00000000 here we want the data register D0 to be set to 0
    
    MOVE.L (A1)+, D2                ; A1:00001024 D2:00000005 moving 32-bit value from the address pointed to by address register A1 into data register D2 and only then A1 is incremented to point to the next 32-bit value in memory (which is 0000000A)
    ADD.L D2, D0                    ; D0:00000005 addition of the value in D2 (which is 00000010) to the value in D0 (which is 0000000) and storing the result into D0 data register
                                    ; repeated process 
    MOVE.L (A1)+, D2                ; A1:00001028 D2:000000A                
    ADD.L D2,D0                     ; D0:00000005
    
    MOVE.L (A1)+,D2                 ; A1:0000102C D2:0000000F
    ADD.L D2,D0                     ; D0:0000001E
    
    MOVE.L (A1)+, D2                ; A1:00001030 D2:00000014
    ADD.L D2,D0                     ; D0:00000032
    
    MOVE.L (A1)+, D2                ; A1:00001034 D2:0000001E
    ADD.L D2, D0                    ; D0:00000050
    
    MOVE.L (A1)+,D2                 ; A1:00001038 D2:FFFFFFFF (2s complement which leads to -1) garbage (whatever is stored after array in memory in this case FFFFFFFF)
    ADD.L D2,D0                     ; D0:0000004F garbage
    
    
    ACHIEVEMENT_POINTS: DC.L 5,10,15,20,30
    
* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source
    
    

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
