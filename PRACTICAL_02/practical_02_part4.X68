*-----------------------------------------------------------
* Title      :  practical_02_part4.X68
* Written by :  Temur Rustamov
* Date       :  22/01/24
* Description:  part 4
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    
    MOVE.L #%10,       $3000          
    MOVE.B #$10,       $3010          
    MOVE.W #10,        $3020

    MOVE.L #%10,       $3000          
    MOVE.L #$10,       $3010          
    MOVE.L #10,        $3020          

    MOVE.L #%10,       D0         
    MOVE.L #$10,       D1          
    MOVE.L #10,        D2          
    
    MOVE.L D0,         $3000       
    MOVE.L D1,         $3010       
    MOVE.L D2,         $3020       
   
    MOVE.L #100,        $3020       
    MOVE.L #$100,       $3010       
    MOVE.L #%100,       $3000      
    
    MOVE.B $3020,       D0        
    MOVE.B $3010,       D1       
    MOVE.B $3000,       D2       

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
