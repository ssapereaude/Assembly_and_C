*-----------------------------------------------------------
* Title      :  practical_02_part4.X68
* Written by :  Temur Rustamov
* Date       :  22/01/24
* Description:  part 4
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    MOVE.L #%100,       D0          ; moving the 32-bit 100 (in binary) (4 in hex) to the data register D0
    MOVE.L #$100,       D1          ; moving the 32-bit 100 (in hex) to the data register D1
    MOVE.L #100,        D2          ; moving the 32-bit 100 (in decimal) (64 in hex) to the data register D2
    
    MOVE.L D0,          $3000       ; moving the 32-bit 4 (in hex) to the memory location $3000 (00 00 00 04)
    MOVE.L D1,          $3010       ; moving the 32-bit 100 (in hex) to the memory location $3010 (00 00 01 00)
    MOVE.L D2,          $3020       ; moving the 32-bit 64 (in hex) to the memory location $3020 (00 00 00 64)
    
    MOVE.W #100,        $3020       ; moving the 16-bit 100 (in decimal) (64 in hex) to the memory location $3020 (00 64 00 64)
    MOVE.W #$100,       $3010       ; moving the 16-bit 100 (in hex) to the memory location $3010 (01 00 01 00)
    MOVE.W #%100,       $3000       ; moving the 16-bit 100 (in binary) to the memory location $3000 (00 04 00 04)
    
    MOVE.B #100,        $3020       ; moving the 8-bit 100 (in decimal) (64 in hex) to the memory location $3020 (64 64 00 64)
    MOVE.B #$64,        $3010       ; moving the 8-bit 64 (in hex) to the memory location $3010 (64 00 01 00)
    MOVE.B #%10001111,  $3000       ; moving the 8-bit 10001111 (in binary) (8F in hex) to the memory location $3000 (8F 04 00 04

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
