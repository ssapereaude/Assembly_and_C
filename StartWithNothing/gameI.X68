*-----------------------------------------------------------
* Title      :  Option I
* Written by :  Temur Rustamov
* Date       :  27/02/2024
* Description:  Text-based Game
*-----------------------------------------------------------
    ORG    $1000
                 ; first instruction of program

* Put program code here
*START OF GAME
START:
    MOVE.B  #100,$4000 PUT SCORE/HEALTH IN MEMORY LOCATION $4000
    LEA     $4000,A3   ASSIGN ADDRESS A3 TO THAT MEMORY LOCATION
    
    MOVE.W  #100,HEALTH


    BSR     WELCOME    BRANCH TO THE WELCOME SUBROUTINE
    BSR     QUESTION_1
    ;BSR     INPUT      BRANCH TO THE INPUT SUBROUTINE
    ;BSR     GAME       BRANCH TO THE GAME SUBROUTINE
*GAME LOOP
    ORG     $3000      THE REST OF THE PROGRAM IS TO BE LOCATED FROM 3000 ONWARDS
;GAME:
    ;BSR     GAMELOOP   BRANCH TO GAMELOOP SUBROUTINE
    ;RTS                RETURN FROM GAME: SUBROUTINE
          

    
WELCOME:
    LEA     WELCOME_MSG,A1      ASSIGN MESSAGE TO ADDRESS REGISTER A1
    MOVE.B  #14,D0              MOVE LITERAL 14 TO DO
    TRAP    #15                 TRAP AND INTERPRET VALUE IN D0
    RTS
    
QUESTION_1:
    LEA     QUESTION_1_TEXT,A1  ASSIGN MESSAGE TO ADDRESS REGISTER A1
    MOVE.B  #14,D0              MOVE LITERAL 14 TO DO
    TRAP    #15                 TRAP AND INTERPRET VALUE IN D0
    
    MOVE.B #4,D0
    TRAP #15
    
    CMP #1,D1
    BEQ ANSWER_1_1
    BRA ANSWER_1_2
    RTS
    
QUESTION_2:
    LEA     QUESTION_2_TEXT,A1  ASSIGN MESSAGE TO ADDRESS REGISTER A1
    MOVE.B  #14,D0              MOVE LITERAL 14 TO DO
    TRAP    #15                 TRAP AND INTERPRET VALUE IN D0
    
    MOVE.B  #4,D0
    TRAP    #15
    
    CMP #1,D1
    BEQ ANSWER_2_1
    BRA ANSWER_2_2
    RTS
    
QUESTION_3:
    BRA END
    
ANSWER_1_1:
    SUB.W #1,HEALTH
    MOVE HEALTH,D3
    BSR CLEAR_SCREEN
    BSR GAME_STATS
    BRA QUESTION_2
    
ANSWER_1_2:
    SUB.W #2,HEALTH
    MOVE HEALTH,D3
    BSR CLEAR_SCREEN
    BSR GAME_STATS
    BRA QUESTION_2
    
ANSWER_2_1:
    SUB.W #1,HEALTH
    MOVE HEALTH,D3
    BSR CLEAR_SCREEN
    BSR GAME_STATS
    BRA QUESTION_3
    
ANSWER_2_2:
    SUB.W #2,HEALTH
    MOVE HEALTH,D3
    BSR CLEAR_SCREEN
    BSR GAME_STATS
    BRA QUESTION_3

    
CLEAR_SCREEN:
    MOVE.B #11,D0
    MOVE.W #$FF00,D1
    TRAP #15
    RTS
    
GAME_STATS:
    LEA     HEALTH_TEXT,A1
    MOVE.B #14,D0
    TRAP #15
    
    MOVE.W  HEALTH,D1
    MOVE.B #3,D0
    TRAP #15
    
    LEA     FOR_TEXT,A1
    MOVE.B #14,D0
    TRAP #15
    
   
END:
    SIMHALT             ; halt simulator
    

    

    



* Put variables and constants here
WELCOME_MSG:    DC.B    '************************************************************'
                DC.B    $0D,$0A
                DC.B    'WELCOME!'
                DC.B    $0D,$0A
                DC.B    '************************************************************'
                DC.B    $0D,$0A,0
QUESTION_1_TEXT:    
                DC.B    $0D,$0A 
                DC.B    'WHAT IS YOUR FAVOURITE COLOUR?'
                DC.B    $0D,$0A
                DC.B    'TYPE ''1'' IF RED OR TYPE ''2'' IF BLUE:'
                DC.B    $0D,$0A,0
                
QUESTION_2_TEXT:    
                DC.B    $0D,$0A 
                DC.B    'WHAT IS YOUR FAVOURITE NUMBER?'
                DC.B    $0D,$0A
                DC.B    'TYPE ''1'' IF 5 OR TYPE ''2'' IF 6:'
                DC.B    $0D,$0A,0
                
HEALTH:         DC.W    0   
HEALTH_TEXT     DC.B    'HEALTH:',0
FOR_TEXT        DC.B    $0D,$0A,0


    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
