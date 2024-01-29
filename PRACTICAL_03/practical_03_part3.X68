*-----------------------------------------------------------
* Title      :  practical_03_part3.X68
* Written by :  Temur Rustamov
* Date       :  29/01/2024
* Description:  Understand and utilise Address Registers
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    LEA HEALTH, A3      ; A3: 0000100E $1000 0E: 64
                        ; load the effective address of 'health' label into address register A3
    SUB.B #10, (A3)     ; $1000 0E: 5A

    SIMHALT             ; halt simulator

* Put variables and constants here

HEALTH dc.b $64         ; define constant,byte to reserve memory&initialize with the specified value to the label health
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
