*-----------------------------------------------------------
* Title      :  practical_03_part4.X68
* Written by :  Temur Rustamov
* Date       :  29/01/2024
* Description:  Understand and utilise Address Registers
*-----------------------------------------------------------
    ORG    $1000
START:                      ; first instruction of program

* Put program code here
    LEA HEALTH,A0           ;
    LEA PlayerPoints, A1    ;
    LEA PlayerHealth,A2     ;
    LEA PlayerXPosition, A3 ;
    LEA PlayerYPosition,A4  ;
    LEA BossHealth, A5      ;
    LEA BossXPosition,A6    ;
    LEA BossYPosition, A7   ;
    

    SIMHALT                 ; halt simulator

* Put variables and constants here
HEALTH dc.b #$64
PlayerPoints dc.b #100
PlayerHealth dc.b #%1100100
PlayerXPosition dc.b #$05
PlayerYPosition dc.b #$10
BossHealth dc.b #%1100100
BossXPosition dc.b #$10
BossYPosition dc.b #$05

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
