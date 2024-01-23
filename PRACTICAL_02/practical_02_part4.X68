*-----------------------------------------------------------
* Title      :  practical_02_part4.X68
* Written by :  Temur Rustamov
* Date       :  22/01/24
* Description:  part 4
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    
    MOVE.L  #%101010101010101010101010, $3000  ; 00 AA AA AA
    MOVE.W  #$9FA1, $3010  ; 9F A1 FF FF  
    MOVE.B  #155,  $3020  ; 9B FF FF FF
    
    MOVE.L  #%101010101010101010101010, D0  ; 00 AA AA AA
    MOVE.L  #$9FA1, D1  ; 00 00 9F A1 
    MOVE.L  #155,  D2  ; 00 00 00 9B
    
    MOVE.L  #%101010101010101010101010, $3000  ; 00 AA AA AA
    MOVE.W  #$9FA1, $3010  ; 9F A1 FF FF  
    MOVE.W  #155,  $3020  ; 00 9B FF FF
    
    MOVE.B  $3000, D0  ; 00 AA AA 00
    MOVE.B  $3010, D1  ; 00 00 9F 9F  
    MOVE.B  $3020, D2  ; 00 00 00 00
    
    MOVE.W D0, $3000    ; AA 00 AA AA
    MOVE.W D1, $3010    ; 9F 9F FF FF
    MOVE.W D2, $3020    ; 00 00 FF FF
    
    MOVE.W  #$B, D0  ; 00 AA 00 0B
    MOVE.B  #$EE, D1  ; 00 00 9F EE  
    MOVE.W  #$EEEE, D2  ; 00 00 EE EE
    
    MOVE.B #$B, $3000    ; 0B 00 AA AA
    MOVE.W #$AA, $3010    ; 00 AA FF FF
    MOVE.W #100, $3020    ; 00 64 FF FF
    
    MOVE.B  #$00, D0  ; 00 AA 00 00
    MOVE.W  #%1011, D1  ; 00 00 00 0B  
    MOVE.L  #100, D2  ; 00 00 EE 64
    
    MOVE.B #$B0, $3000    ; B0 00 AA AA
    MOVE.B #%1010, $3010    ; 0A AA FF FF
    MOVE.B #26, $3020    ; 1A 64 FF FF
    
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
