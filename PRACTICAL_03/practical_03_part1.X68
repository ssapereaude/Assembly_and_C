*-----------------------------------------------------------
* Title      :  practical_03_part1.X68
* Written by :  Temur Rustamov
* Date       :  29/01/2024
* Description:  Understand and utilise Address Registers
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    LEA $4000, A1       ;  A1:00004000
    MOVE.B #100, (A1)   ;  $4000: 64
                        ;  LEA- Load effective address of #4000 into A1
                        ;  MOVE.B - to move the byte value 100 (64hex) to A1 ($4000) 
                        ;  Address register denoted as An - 16/32-bit n=0-7 used for storing address (reference) instead of accessing actual data 

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
