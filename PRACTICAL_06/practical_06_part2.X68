*-----------------------------------------------------------
* Title      :  practical_06_part2.X68  
* Written by :  Temur Rustamov  
* Date       :  26/02/2024
* Description:  Conditional Branches and Control Structures
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    MOVE    #0,D0       ; Display n characters of string at (A1), n is D1.W (stops on NULL or max 255) with CR, LF. (see task 13)  
    LEA     TEXT,A1     ; A1 = address of string to display.
                        ; A1=0000100E
                        
    MOVE    #1,D0       ; Display n characters of string at (A1), n is D1.W (stops on NULL or max 255) without CR, LF. (see task 14)  
    LEA     TEXT1,A1     ; A1 = address of string to display.
                        ; A1=00001018
                        
    MOVE    #2,D0       ; Read string from keyboard and store at (A1), NULL (0) terminated, length returned in D1.W (max 80)   
    LEA     TEXT2,A1     ; A1 = address of string to display.
                        ; A1=00001034
                        
    MOVE    #0,D0       ; Display n characters of string at (A1), n is D1.W (stops on NULL or max 255) with CR, LF. (see task 13)  
    LEA     TEXT,A1     ; A1 = address of string to display.
                        ; A1=0000100E
                        
    MOVE    #1,D0       ; Display n characters of string at (A1), n is D1.W (stops on NULL or max 255) without CR, LF. (see task 14)  
    LEA     TEXT1,A1     ; A1 = address of string to display.
                        ; A1=00001018
                        
    MOVE    #2,D0       ; Read string from keyboard and store at (A1), NULL (0) terminated, length returned in D1.W (max 80)   
    LEA     TEXT2,A1     ; A1 = address of string to display.
                        ; A1=00001034
                        
    MOVE    #0,D0       ; Display n characters of string at (A1), n is D1.W (stops on NULL or max 255) with CR, LF. (see task 13)  
    LEA     TEXT,A1     ; A1 = address of string to display.
                        ; A1=0000100E
                        
    MOVE    #1,D0       ; Display n characters of string at (A1), n is D1.W (stops on NULL or max 255) without CR, LF. (see task 14)  
    LEA     TEXT1,A1     ; A1 = address of string to display.
                        ; A1=00001018
                        
    MOVE    #2,D0       ; Read string from keyboard and store at (A1), NULL (0) terminated, length returned in D1.W (max 80)   
    LEA     TEXT2,A1     ; A1 = address of string to display.
                        ; A1=00001034
                        
    MOVE    #0,D0       ; Display n characters of string at (A1), n is D1.W (stops on NULL or max 255) with CR, LF. (see task 13)  
    LEA     TEXT,A1     ; A1 = address of string to display.
                        ; A1=0000100E
                        
    MOVE    #1,D0       ; Display n characters of string at (A1), n is D1.W (stops on NULL or max 255) without CR, LF. (see task 14)  
    LEA     TEXT1,A1     ; A1 = address of string to display.
                        ; A1=00001018
                        
    MOVE    #2,D0       ; Read string from keyboard and store at (A1), NULL (0) terminated, length returned in D1.W (max 80)   
    LEA     TEXT2,A1     ; A1 = address of string to display.
                        ; A1=00001034

    SIMHALT             ; halt simulator
TEXT    dc.b    'Hello World',0   Null terminated string.
TEXT1    dc.b    'Hello',0   Null terminated string.
TEXT2    dc.b    'Hel',0   Null terminated string.
* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
