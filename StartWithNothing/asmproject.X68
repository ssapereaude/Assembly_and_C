
*-----------------------------------------------------------
* Title      :  Option I
* Written by :  Temur Rustamov
* Date       :  27/02/2024
* Description:  asmproject
*-----------------------------------------------------------
    ORG    $1000
*-----------------------------------------------------------
* Section       : Filling Colour 
* Description   : making the fill colour blue
*-----------------------------------------------------------
START:                  ; first instruction of program

    LEA     $4000,A3        
    MOVE.L	#$000000FF,D1	Make the fill color blue
	MOVE.B	#21,D0
	TRAP	#15
*-----------------------------------------------------------
* Section       : Game Loop 
* Description   : The script: start with 5$, end with 80$
*-----------------------------------------------------------	
GAME_LOOP:
    BSR     START_PART
    BSR     CLEAR_SCREEN
    BSR     USER_PART
    BSR     PASSWORD_PART
    BSR     CLEAR_SCREEN
    BSR     BEGINNING_PART
    BSR     CLEAR_SCREEN
    BSR     WELCOME_PART
    BSR     WARNING_PART_1
    BSR     PRESS_ENTER_PART
    BSR     CLEAR_SCREEN
    BSR     WELCOME_PART
    BSR     WARNING_PART_2
    BSR     PRESS_ENTER_PART
    BSR     CLEAR_SCREEN
    BSR     WELCOME_PART
    BSR     WARNING_PART_3
    BSR     PRESS_ENTER_PART
    BSR     CLEAR_SCREEN
    BSR     WELCOME_PART
    BSR     WARNING_PART_4
    BSR     PRESS_ENTER_PART
    BSR     CLEAR_SCREEN
    BSR     WELCOME_PART
    BSR     WARNING_PART_5
    BSR     PRESS_ENTER_PART
    BSR     CLEAR_SCREEN
    BSR     WELCOME_PART
    BSR     WARNING_PART_6
    BSR     PRESS_ENTER_PART
    BSR     CLEAR_SCREEN
    BSR     WELCOME_PART
    BSR     WARNING_PART_7
    BSR     PRESS_ENTER_PART
    BSR     CLEAR_SCREEN
    BSR     WELCOME_PART
    BSR     WARNING_PART_8
    BSR     PRESS_ENTER_PART
    BSR     CLEAR_SCREEN
    BSR     CHOICE_1
    BSR     CLEAR_SCREEN
    BSR     GAME_LEVEL_1
    ;BSR     NEXT_LINE
    BSR     GAME_LEVEL_1_OUTPUT
    BSR     GAME_LEVEL_2
    BSR     GAME_LEVEL_2_OUTPUT
    BSR     GAME_LEVEL_3
    BSR     GAME_LEVEL_3_OUTPUT
    BSR     GAME_LEVEL_4
    BSR     GAME_LEVEL_4_OUTPUT
    BSR     GAME_LEVEL_5
    BSR     GAME_LEVEL_5_OUTPUT
    BSR     CHOICE_2
    BSR     GAME_LEVEL_6
    BSR     GAME_LEVEL_7
    BSR     GAME_LEVEL_8
    BSR     GAME_LEVEL_8_OUTPUT
    BSR     GAME_LEVEL_9
    BSR     GAME_LEVEL_9_OUTPUT
    BSR     GAME_LEVEL_10
    BSR     GAME_LEVEL_10_OUTPUT
    BSR     GAME_LEVEL_11
    BSR     GAME_LEVEL_12
    BSR     GAME_LEVEL_12_OUTPUT
    BSR     GAME_LEVEL_13
    BSR     GAME_LEVEL_13_OUTPUT
    BSR     GAME_LEVEL_14
    BSR     GAME_LEVEL_15
    BSR     GAME_LEVEL_15_OUTPUT
    BSR     GAME_LEVEL_16
    BSR     GAME_LEVEL_16_OUTPUT
    BSR     GAME_LEVEL_17
    BSR     GAME_LEVEL_18
    BSR     GAME_LEVEL_18_OUTPUT
    BSR     GAME_LEVEL_19
    BSR     GAME_LEVEL_19_OUTPUT
    BSR     GAME_LEVEL_20
    BSR     GAME_LEVEL_21
    BSR     GAME_LEVEL_21_OUTPUT
    BSR     GAME_LEVEL_22
    BSR     GAME_LEVEL_22_OUTPUT
    BSR     GAME_LEVEL_23
    BSR     GAME_LEVEL_23_OUTPUT
    BSR     GAME_LEVEL_24
    BSR     GAME_LEVEL_25
    BSR     CLEAR_SCREEN
    BRA     GAME_LOOP
    

*-----------------------------------------------------------
* Section       : Start Part 
* Description   : Press 1
*-----------------------------------------------------------    
START_PART:
    LEA     START_MSG,A1
    MOVE    #14,D0              
    TRAP    #15

    MOVE    #4,D0
    TRAP    #15
    
    CMP     #1,D1
    BNE     .NO_START
    RTS
    
.NO_START:
    BSR CLEAR_SCREEN
    BSR GAME_LOOP
    
*-----------------------------------------------------------
* Section       : Clear Screen
* Description   : To clear previous I/O
*-----------------------------------------------------------
    
CLEAR_SCREEN:
    MOVE.L #11,D0
    MOVE.W #$FF00,D1
    TRAP #15
    RTS

*-----------------------------------------------------------
* Section       : User Part
* Description   : Enter username (cerber)
*-----------------------------------------------------------
USER_PART:
    LEA     USER_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     USER_INPUT_MSG,A1
    
    
    MOVE    #2,D0
    TRAP    #15
    
    MOVE.W (A1),USER_INPUT_MSG
    
    LEA     USER_KEY,A6
    
    MOVE.L  (A1),D0
    CMP.L   (A6),D0
    
    
    
    BNE     .NO_USER
    MOVE.W #0,ATTEMPTS
    RTS
    
    

.NO_USER:
    BSR COMPARISON_PART
    
    LEA     NO_USER_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BRA USER_PART
    
*-----------------------------------------------------------
* Section       : Password Part
* Description   : Enter password (1234)
*-----------------------------------------------------------
    
PASSWORD_PART:
    LEA     PASSWORD_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    ;LEA     PASSWORD_INPUT_MSG,A1
    
    MOVE    #4,D0
    TRAP    #15
    
    ;MOVE.W (A1),PASSWORD_INPUT_MSG
    
    LEA     PASSWORD_KEY,A6
    
    MOVE.L   D1,D0
    CMP.L   (A6),D0
    
    BNE .NO_PASSWORD
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_PASSWORD:
    BSR COMPARISON_PART
    
    LEA     NO_PASSWORD_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BRA PASSWORD_PART
    
*-----------------------------------------------------------
* Section       : Previous Draft
* Description   : -
*-----------------------------------------------------------

GAME_STATS:
    BSR     CLEAR_SCREEN
    LEA     GAME_STATS_MSG,A1
    MOVE    #14,D0
    TRAP    #15

    MOVE.W  BALANCE,D1
    MOVE.B  #3,D0
    TRAP #15
    RTS 
    
*-----------------------------------------------------------
* Section       : Comparison Part
* Description   : Exceeding 2 attempts leads to game over
*-----------------------------------------------------------

COMPARISON_PART:
    ADD.W   #1, ATTEMPTS
    CMP.W   #2, ATTEMPTS
    BEQ GAME_OVER
    RTS
    
*-----------------------------------------------------------
* Section       : Beginning Part
* Description   : You have to download the file 'asmproject.x68'
*-----------------------------------------------------------
    
BEGINNING_PART:
    LEA     BEGINNING_MSG,A1  
    MOVE.B  #14,D0              
    TRAP    #15                 
    
    MOVE.B #5,D0
    TRAP #15
    
    CMP.B #$59,D1
    BNE .NO_BEGINNING
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_BEGINNING:
    BSR COMPARISON_PART
    
    LEA     NO_BEGINNING_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15

    BRA BEGINNING_PART
    
*-----------------------------------------------------------
* Section       : Welcome Part
* Description   : Welcoming Message separated into 8 parts
*-----------------------------------------------------------
    
WELCOME_PART:
    LEA     WELCOME_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
WARNING_PART_1:
    LEA     WARNING_MSG_1,A1
    MOVE    #14,D0
    TRAP    #15
    RTS 
    
*-----------------------------------------------------------
* Section       : Press Enter Part
* Description   : Press Enter to continue
*-----------------------------------------------------------

PRESS_ENTER_PART:
    LEA     PRESS_ENTER_MSG,A1  
    MOVE.B  #14,D0              
    TRAP    #15                 
    
    MOVE.B #5,D0
    TRAP #15
    
    CMP.B #$D,D1
    BNE .NO_PRESS_ENTER
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_PRESS_ENTER:
    BSR COMPARISON_PART
    
    LEA     NO_PRESS_ENTER_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15

    BRA PRESS_ENTER_PART
    
WARNING_PART_2:
    LEA     WARNING_MSG_2,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
WARNING_PART_3:
    LEA     WARNING_MSG_3,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
WARNING_PART_4:
    LEA     WARNING_MSG_4,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
WARNING_PART_5:
    LEA     WARNING_MSG_5,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
WARNING_PART_6:
    LEA     WARNING_MSG_6,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
WARNING_PART_7:
    LEA     WARNING_MSG_7,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
WARNING_PART_8:
    LEA     WARNING_MSG_8,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Choice 1 Part
* Description   : 2 path: 1st Path: Game / 2nd Path: End Part (if no 80$, game over, otherwise win which is endless part) 
*-----------------------------------------------------------------------------------------------------------------------------

CHOICE_1:
    LEA     CHOICE_1_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.B  #4,D0
    TRAP    #15

    
    CMP.B    #1,D1
    BNE     NO_CHOICE_1
    RTS


NO_CHOICE_1:    
    BSR     CLEAR_SCREEN
    
    LEA     NO_CHOICE_1_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  BALANCE,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    LEA     NO_CHOICE_1_MSG_CONT,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.B  #5,D0
    TRAP    #15
    
    CMP.W   #80,BALANCE
    BEQ     FINAL   
    BSR     GAME_OVER 

FINAL:
    BSR CLEAR_SCREEN
    MOVE.W #0,BALANCE
    BRA GAME_LOOP
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part
* Description   : There are 25 Game Levels requiring demonstration of linux commands
*-----------------------------------------------------------------------------------------------------------------------------

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part I
* Description   : Demonstration of pwd command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_1:


    
    LEA     GAME_LEVEL_1_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_1_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_1_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_1
    MOVE.W #0,ATTEMPTS
    RTS

.NO_GAME_LEVEL_1:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_1_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_1
    
NEXT_LINE:
    LEA     NEXT_LINE_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
GAME_LEVEL_1_OUTPUT:
    LEA     GAME_LEVEL_1_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part II
* Description   : Demonstration of ls command
*-----------------------------------------------------------------------------------------------------------------------------    
GAME_LEVEL_2:

    ;LEA     USER_INPUT_MSG,A1
    ;MOVE    #14,D0
    ;TRAP    #15

    
    LEA     GAME_LEVEL_2_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_2_INPUT_MSG,A1

    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_2_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_2
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_2:

    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_2_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_2
    
GAME_LEVEL_2_OUTPUT:
    LEA     GAME_LEVEL_2_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part III
* Description   : Demonstration of cd command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_3:
    LEA     GAME_LEVEL_3_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_3_INPUT_MSG,A1

    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_3_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_3
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_3:
    
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_3_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_3
    
GAME_LEVEL_3_OUTPUT:
    LEA     GAME_LEVEL_3_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part IV
* Description   : Demonstration of ls command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_4:
    LEA     GAME_LEVEL_4_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_4_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_4_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_4
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_4:
    
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_4_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_4

    
GAME_LEVEL_4_OUTPUT:
    LEA     GAME_LEVEL_4_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part V
* Description   : Demonstration of cat command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_5:
    LEA     GAME_LEVEL_5_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_5_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_5_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_5
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_5:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_5_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_5
    
GAME_LEVEL_5_OUTPUT:
    LEA     GAME_LEVEL_5_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part V (Choice)
* Description   : That is the reason why there is the ransomware downloaded in the system
*-----------------------------------------------------------------------------------------------------------------------------    
CHOICE_2:    
    MOVE.B  #4,D0
    TRAP    #15

    
    CMP.B    #2,D1
    BNE     .NO_CHOICE_2
    MOVE.W #0,ATTEMPTS
    RTS


.NO_CHOICE_2:    
    BSR COMPARISON_PART
    
    LEA     NO_CHOICE_2_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA CHOICE_2
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part VI
* Description   : Text Content
*-----------------------------------------------------------------------------------------------------------------------------

    
GAME_LEVEL_6:
    LEA     GAME_LEVEL_6_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part VII
* Description   : Demonstration of rm command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_7:
    LEA     GAME_LEVEL_7_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_7_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_7_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_7
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_7:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_7_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_7

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part VIII
* Description   : Demonstration of ls command
*-----------------------------------------------------------------------------------------------------------------------------    
GAME_LEVEL_8:
    LEA     GAME_LEVEL_8_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_8_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_8_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_8
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_8:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_8_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_8
    
GAME_LEVEL_8_OUTPUT:
    LEA     GAME_LEVEL_8_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part VIV
* Description   : Demonstration of cat command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_9:
    LEA     GAME_LEVEL_9_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_9_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_9_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_9
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_9:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_9_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_9
    

GAME_LEVEL_9_OUTPUT:
    ADD.W   #15, BALANCE
    LEA     GAME_LEVEL_9_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part X
* Description   : Demonstration of clear command
*-----------------------------------------------------------------------------------------------------------------------------    
GAME_LEVEL_10:
    LEA     GAME_LEVEL_10_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_10_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_10_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_10
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_10:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_10_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_10
    

GAME_LEVEL_10_OUTPUT:
    BSR CLEAR_SCREEN
    RTS

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XI
* Description   : Demonstration of rm command
*-----------------------------------------------------------------------------------------------------------------------------    
GAME_LEVEL_11:
    LEA     GAME_LEVEL_11_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_11_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_11_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_11
    MOVE.W #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_11:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_11_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_11
    
;GAME_LEVEL_11_OUTPUT:
 ;   LEA     GAME_LEVEL_11_OUTPUT_MSG,A1
  ;  MOVE    #14,D0
   ; TRAP    #15
    ;RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XII
* Description   : Demonstration of ls command
*-----------------------------------------------------------------------------------------------------------------------------    
GAME_LEVEL_12:
    LEA     GAME_LEVEL_12_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_12_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_12_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_12
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_12:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_12_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_12
    
GAME_LEVEL_12_OUTPUT:
    LEA     GAME_LEVEL_12_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XIII
* Description   : Demonstration of cat command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_13:
    LEA     GAME_LEVEL_13_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_13_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_13_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_13
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_13:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_13_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_13
    
GAME_LEVEL_13_OUTPUT:
    ADD.W   #15, BALANCE
    LEA     GAME_LEVEL_13_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XIV
* Description   : Demonstration of rm command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_14:
    LEA     GAME_LEVEL_14_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_14_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_14_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_14
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_14:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_14_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_14
    

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XV
* Description   : Demonstration of ls command
*-----------------------------------------------------------------------------------------------------------------------------    
GAME_LEVEL_15:
    LEA     GAME_LEVEL_15_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_15_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_15_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_15
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_15:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_15_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_15
    
GAME_LEVEL_15_OUTPUT:
    ;ADD.W   #15, BALANCE
    LEA     GAME_LEVEL_15_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XVI
* Description   : Demonstration of running bush files
*-----------------------------------------------------------------------------------------------------------------------------    
GAME_LEVEL_16:
    LEA     GAME_LEVEL_16_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_16_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_16_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_16
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_16:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_16_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_16
    
GAME_LEVEL_16_OUTPUT:
    ADD.W   #15, BALANCE
    LEA     GAME_LEVEL_16_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XVII
* Description   : Demonstration of rm command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_17:
    LEA     GAME_LEVEL_17_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_17_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_17_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_17
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_17:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_17_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_17
    

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XVIII
* Description   : Demonstration of ls command
*-----------------------------------------------------------------------------------------------------------------------------    
GAME_LEVEL_18:
    LEA     GAME_LEVEL_18_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_18_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_18_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_18
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_18:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_18_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_18
    
GAME_LEVEL_18_OUTPUT:
    ;ADD.W   #15, BALANCE
    LEA     GAME_LEVEL_18_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XIX
* Description   : Demonstration of ls command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_19:
    LEA     GAME_LEVEL_19_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_19_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_19_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_19
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_19:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_19_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_19
    
GAME_LEVEL_19_OUTPUT:
    ADD.W   #15, BALANCE
    LEA     GAME_LEVEL_19_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XX
* Description   : Demonstration of rm command
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_20:
    LEA     GAME_LEVEL_20_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_20_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_20_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_20
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_20:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_20_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_20
    

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XXI
* Description   : Demonstration of ls command
*-----------------------------------------------------------------------------------------------------------------------------    
GAME_LEVEL_21:
    LEA     GAME_LEVEL_21_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_21_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_21_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_21
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_21:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_21_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_21
    
GAME_LEVEL_21_OUTPUT:
    ;ADD.W   #15, BALANCE
    LEA     GAME_LEVEL_21_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS
   
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XXII
* Description   : Demonstration of cat command
*----------------------------------------------------------------------------------------------------------------------------- 
GAME_LEVEL_22:
    LEA     GAME_LEVEL_22_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_22_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_22_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_22
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_22:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_22_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_22
    
GAME_LEVEL_22_OUTPUT:
    ADD.W   #15, BALANCE
    LEA     GAME_LEVEL_22_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XXIII
* Description   : Demonstration of curl command
*-----------------------------------------------------------------------------------------------------------------------------   
GAME_LEVEL_23:
    LEA     GAME_LEVEL_23_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_23_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_23_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_23
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_23:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_23_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_23
    
GAME_LEVEL_23_OUTPUT:
    ;ADD.W   #15, BALANCE
    LEA     GAME_LEVEL_23_OUTPUT_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    RTS

*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XXIV
* Description   : Entering The Private Key
*-----------------------------------------------------------------------------------------------------------------------------    
GAME_LEVEL_24:

    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_24_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    ;MOVE.L  (A1),D0
    ;CMP.L   (A6),D0
    
    BNE .NO_GAME_LEVEL_24

    LEA     GAME_LEVEL_24_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    ;LEA     GAME_LEVEL_24_INPUT_MSG,A1
    
    ;MOVE    #2,D0
    ;TRAP    #15
    
    
    ;LEA     GAME_LEVEL_24_KEY,A6
    
    ;MOVE.B  (A1),D0
    ;CMP.B   (A6),D0
    
    ;BNE     .NO_GAME_LEVEL_24
    MOVE.W  #0,ATTEMPTS
    RTS
    
.NO_GAME_LEVEL_24:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_24_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_24
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Part XXV
* Description   : Demonstrating lynx commnad
*-----------------------------------------------------------------------------------------------------------------------------
    
GAME_LEVEL_25:
    LEA     GAME_LEVEL_25_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    LEA     GAME_LEVEL_25_INPUT_MSG,A1
    
    MOVE    #2,D0
    TRAP    #15
    
    
    LEA     GAME_LEVEL_25_KEY,A6
    
    MOVE.B  (A1),D0
    CMP.B   (A6),D0
    
    BNE     .NO_GAME_LEVEL_25
    MOVE.W  #0,ATTEMPTS
    BRA     NO_CHOICE_1
    
.NO_GAME_LEVEL_25:
    BSR COMPARISON_PART
    
    LEA     NO_GAME_LEVEL_25_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    
    MOVE.W  ATTEMPTS,D1
    MOVE.B  #3,D0
    TRAP    #15
    
    BSR NEXT_LINE

    BRA GAME_LEVEL_25
    
    

    

    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Game Over
* Description   : If you fail the attempts or entered the 2 path too early with 5$
*-----------------------------------------------------------------------------------------------------------------------------
    

   
    
GAME_OVER:
    BSR CLEAR_SCREEN
    LEA     GAME_OVER_MSG,A1
    MOVE    #14,D0
    TRAP    #15
    BSR END       

END:
    SIMHALT  
    
*-----------------------------------------------------------------------------------------------------------------------------
* Section       : Variables
* Description   : Variable Declaration for I/O and also some of them to avoid the problems with overwritting
*-----------------------------------------------------------------------------------------------------------------------------
* Put program code here
WELCOME_MSG:
    DC.B '     .;;;;;MM;         .\,.mmSSSm,,/,      ,SSSMM;;;                 ',$0D,$0A
    DC.B '   ;;;;;;mMM;        .;MMmSSSSSSSmMm;     ;MSSMM;;;;                 ',$0D,$0A
    DC.B '  ;;;;;;mMSM;     ,_ ;MMmS;;;;;;mmmM;  -,;MMMMMMm;;;;                ',$0D,$0A
    DC.B ' ;;;;;;;;MMSMM;     \"*;M;( ( '') );m;*"/ ;MMMMMM;;;;;,              ',$0D,$0A
    DC.B '.;;;;;;mMMSMM;      \(@;!G%     $H!;@)/ ;MMMMMMMM;;;;;,              ',$0D,$0A
    DC.B ' ;;;;;;;MMSSSM;       ;,;.*o*&gt;H&lt;*o*.;m; ;MMMMMMMMM;            ',$0D,$0A
    DC.B '.;;;;;;;MMSSSMM;     ;Mm;           ;M;,MMMMMMMMMMm;;;;;;.           ',$0D,$0A
    DC.B ';;;;;;;mmMSSSMMMM,   ;Mm;,    -    ,;M;MMMMMMMSMMMMm;;;;;;;          ',$0D,$0A
    DC.B ';;;;;;;MMMSSSMMMMMMMm;Mm;;,  ___  ,;SmM;MMMMMMSSMMMM;;;;;;;;         ',$0D,$0A
    DC.B ';;%";;;MMMSSSSMMMMMM;MMmS;;,  "  ,;SmMM;MMMMMMSSMMMM;;;;;;;;.        ',$0D,$0A
    DC.B '!;;;;;MMMSSSSSMMMMM;MMMmSS;;._.;;SSmMM;MMMMMMSSMMMM;;;;;;;;;         ',$0D,$0A
    DC.B ' ;;;;;; ;,SSSM;m.mm!    \.   `.   /  ;MMMM `qSSS    ;;;;;;;          ',$0D,$0A    
    DC.B '   ;;`;;.        mS;;`;  ;     ;    ;M,!     S  fk    ;;;;;          ',$0D,$0A 
    DC.B '    ;;;;;       .mS;;, ; ;. x  ;  X  MM;                ;;;;         ',$0D,$0A 
    DC.B '     ;;;;;      MMmS;; `, ;._.; -_.MMM;                 ;;;;         ',$0D,$0A 
    DC.B '      '';       MMmS;;; ;   ;      ;  MM;                ;;;;        ',$0D,$0A  
    DC.B '       ;               |. ;  ; (. ;  ;      _.-.         ;;          ',$0D,$0A 
    DC.B '          .-----..__  /   ;  ;   ;; ;\  _.-" .- `.      ;;           ',$0D,$0A 
    DC.B '        ;. ___      `*;   `; ;;  ;  ; ;@  .-&    :      ;            ',$0D,$0A 
    DC.B '        ;     """*-.   `.  ;  ;  ;  ; ; ,;      /       |            ',$0D,$0A 
    DC.B '        &,          `-_    (.--;,`--;..*      .%        &            ',$0D,$0A 
    DC.B '          `-_          `*-._*&.\\\;||\\)     ,"                      ',$0D,$0A 
    DC.B '             `"*-._        "*`-ll_ll*l    ,*                         ',$0D,$0A 
    DC.B '                ,==;*-._           "-.  .J                           ',$0D,$0A 
    DC.B '             _-^    "*-=`*;-._        ;H                             ',$0D,$0A 
    DC.B '           ."            ;;  ;"*-.    `                              ',$0D,$0A 
    DC.B '           ;   ____      ;//;     "-   `,                            ',$0D,$0A 
    DC.B '           `+   .-/                 ".\\;                            ',$0D,$0A 
    DC.B '             `*" /                    ";                             ',$0D,$0A 

    DC.B    $0D,$0A,0

START_MSG:
    DC.B    $0D,$0A 
    DC.B    'Press ''1'' to start the game:'
    DC.B    $0D,$0A,0
    DC.B    $ff ; garbage
USER_MSG:
    DC.B    $0D,$0A 
    DC.B    'Username:'
    DC.B    $0D,$0A,0 

NO_USER_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: cer??r',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0 
USER_KEY:
    DC.B    'cerber',0
    
ATTEMPTS    DC.W    0

NO_PASSWORD_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: THE MOST POPULAR PASSWORD',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0




PASSWORD_MSG:
    DC.B    $0D,$0A 
    DC.B    'Password:'
    DC.B    $0D,$0A,0 
    
    
GAME_STATS_MSG:
    DC.B    $0D,$0A  
    DC.B    'Balance ($): ',0
BEGINNING_MSG:
    DC.B    $0D,$0A
    DC.B    'Are you sure you want to download the file named ''asmproject.X68''?'
    DC.B    $0D,$0A
    DC.B    'Press (Y/N):',0  
    
WARNING_MSG_1:
    DC.B    $0D,$0A 
    DC.B    'CERBER RANSOMWARE',0
    
PRESS_ENTER_MSG:
    DC.B    $0D,$0A
    DC.B    'Press ''Enter'':',0
        
WARNING_MSG_2:
    DC.B    $0D,$0A 
    DC.B    'ALL FILES HAVE BEEN ENCRYPTED!',0
    
WARNING_MSG_3:
    DC.B    $0D,$0A
    DC.B    'RECEIVE THE ONLY PRIVATE KEY AND DECRYPTION PROGRAM',0
WARNING_MSG_4:
    DC.B    $0D,$0A
    DC.B    'TO RECEIVE THE PRIVATE KEY AND DECRYPTION PROGRAM:',0
WARNING_MSG_5:
    DC.B    $0D,$0A
    DC.B    '1.GO TO ANY DECRYPTED FOLDER',0
WARNING_MSG_6:
    DC.B    $0D,$0A
    DC.B    '2.OPEN FILE ''READTHIS.txt''' ,0
WARNING_MSG_7:
    DC.B    $0D,$0A
    DC.B    '3.FOLLOW THE INSTRUCTIONS' ,0
WARNING_MSG_8:
    DC.B    $0D,$0A
    DC.B    'OR 10BTC, ALL INSTRUCTIONS WILL BE PROVIDED.' ,0
    
CHOICE_1_MSG:
    DC.B    $0D,$0A
    DC.B    'Choose 1.Try to find the private key'
    DC.B    $0D,$0A
    DC.B    'Choose 2.Transfer 10BTC:',0
    
NO_CHOICE_1_MSG:
    DC.B    $0D,$0A
    DC.B    'Amount($): 80'
    DC.B    $0D,$0A
    DC.B    'IBAN: IE65BOFI900017257357'
    DC.B    $0D,$0A
    DC.B    'Balance ($):',0
    
NO_CHOICE_1_MSG_CONT:
    DC.B    $0D,$0A
    DC.B    'Press (Y):',0
    
GAME_OVER_MSG:    
    DC.B '                     _,.-------------.._              ',$0D,$0A
    DC.B '                  ,-/        j          `-.           ',$0D,$0A
    DC.B '                ,.        .-.               `.        ',$0D,$0A
    DC.B '               /          |                   .       ',$0D,$0A
    DC.B '              /         ,-|                    `      ',$0D,$0A
    DC.B '             .         j                         \    ',$0D,$0A
    DC.B '            .          |                          \   ',$0D,$0A
    DC.B '            : ._       |   _....._                 .  ',$0D,$0A
    DC.B '            |   -.     L-?>       `.               :  ',$0D,$0A
    DC.B '            | `.  \  ..             `.             |  ',$0D,$0A
    DC.B '           /.\  `, Yy                 :           ,|  ',$0D,$0A
    DC.B '          /.  :  | \                  |         ,, |  ',$0D,$0A
    DC.B '         \.    " :  `\                |      ,--   |  ',$0D,$0A
    DC.B '          \    .:     .-..___,..      |    _/      :  ',$0D,$0A
    DC.B '           \  `.      ___   ...._     .-../        :  ',$0D,$0A
    DC.B '         .--    \    /| \_/ | | |      ,,         /   ',$0D,$0A
    DC.B '         |       `--- |    || |||     /         ./    ',$0D,$0A
    DC.B '         |            |      /. |    /       _,/      ',$0D,$0A
    DC.B '         |-.-.....__..|     Y-dp`...:...-..-/         ',$0D,$0A
    DC.B '         |_|_|_L.L.T._/     |                         ',$0D,$0A
    DC.B '         \_|_|_L.T-''/      |                         ',$0D,$0A
    DC.B '          |                /                          ',$0D,$0A
    DC.B '         /             _.--                           ',$0D,$0A
    DC.B '         :         _..|                               ',$0D,$0A
    DC.B '         \__...--''                                   ',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_2_MSG:
    DC.B 'cerber@ubuntuserver:~$ ',0
    DC.B    $ff ; garbage
    
NEXT_LINE_MSG:
    DC.B            $0D,$0A,0
    
GAME_LEVEL_2_KEY:
    DC.B    'ls',0
    
GAME_LEVEL_2_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B '.cache/       Documents/      .ssh/         .config/',$0D,$0A
    DC.B '.local/       Public/         Downloads/    Music/',$0D,$0A
    ;DC.B '',$0D,$0A
    ;DC.B '+-- /usr',$0D,$0A
    ;DC.B '    +-- /usr/bin',$0D,$0A
   ; DC.B '    +-- /usr/include',$0D,$0A
    ;DC.B '    +-- /usr/lib',$0D,$0A
    ;DC.B '    +-- /usr/local',$0D,$0A
    DC.B 'Videos/       snap/',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_1_MSG:
    DC.B 'cerber@ubuntuserver:~$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_1_OUTPUT_MSG:
    DC.B '/home/cerber',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_1_KEY:
    DC.B    'pwd',0
    
GAME_LEVEL_3_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_3_OUTPUT_MSG:
    DC.B            $0D,$0A,0
    
GAME_LEVEL_3_KEY:
    DC.B    'cd Downloads',0
    
GAME_LEVEL_4_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_4_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B 'burpsulte_free_linux_v1_7_15.sh        rocket-history.txt      iamthekey.txt',$0D,$0A
    DC.B 'dontdeleteme.txt                       examples.txt            READTHIS.txt',$0D,$0A
    ;DC.B '',$0D,$0A
    ;DC.B '+-- /usr',$0D,$0A
    ;DC.B '    +-- /usr/bin',$0D,$0A
   ; DC.B '    +-- /usr/include',$0D,$0A
    ;DC.B '    +-- /usr/lib',$0D,$0A
    ;DC.B '    +-- /usr/local',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_4_KEY:
    DC.B    'ls',0
    
GAME_LEVEL_5_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_5_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B 'WILL YOU EVER DOWNLOAD THE FILE ''asmproject.X68'' AGAIN?',$0D,$0A
    DC.B '1. YES    2.NO',$0D,$0A
    DC.B 'Choose (1/2):',0
    
GAME_LEVEL_5_KEY:
    DC.B    'cat iamthekey.txt',0
    
GAME_LEVEL_6_MSG:
    DC.B    $0D,$0A
    DC.B '1. DELETE iamthekey.txt',$0D,$0A
    DC.B '2. OPEN rocket-history.txt',$0D,$0A
    DC.B '3. GET YOUR FIRST 15$ ',$0D,$0A
    DC.B  $0D,$0A,0
    
GAME_LEVEL_7_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
    
GAME_LEVEL_7_KEY:
    DC.B    'rm iamthekey.txt',0
    
GAME_LEVEL_8_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_8_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B 'burpsulte_free_linux_v1_7_15.sh       rocket-history.txt                  ',$0D,$0A
    DC.B 'dontdeleteme.txt                      examples.txt            READTHIS.txt',$0D,$0A
    ;DC.B '',$0D,$0A
    ;DC.B '+-- /usr',$0D,$0A
    ;DC.B '    +-- /usr/bin',$0D,$0A
   ; DC.B '    +-- /usr/include',$0D,$0A
    ;DC.B '    +-- /usr/lib',$0D,$0A
    ;DC.B '    +-- /usr/local',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_8_KEY:
    DC.B    'ls',0
    
GAME_LEVEL_9_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_9_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B 'YOUR BALANCE HAS BEEN UPDATED!',$0D,$0A
    DC.B 'HOW ABOUT TO CLEAR YOUR SCREEN???',$0D,$0A
    DC.B '1. CLEAR the screen',$0D,$0A
    DC.B '2. DELETE this file ',$0D,$0A
    DC.B '3. OPEN examples.txt ',$0D,$0A
    DC.B '4. GET another 15$',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_9_KEY:
    DC.B    'cat rocket-history.txt',0
    
GAME_LEVEL_10_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_10_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_10_KEY:
    DC.B    'clear',0
    
GAME_LEVEL_11_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
    
GAME_LEVEL_11_KEY:
    DC.B    'rm rocket-history.txt',0
    
GAME_LEVEL_12_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_12_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B 'burpsulte_free_linux_v1_7_15.sh                                            ',$0D,$0A
    DC.B 'dontdeleteme.txt                      examples.txt            READTHIS.txt',$0D,$0A
    ;DC.B '',$0D,$0A
    ;DC.B '+-- /usr',$0D,$0A
    ;DC.B '    +-- /usr/bin',$0D,$0A
   ; DC.B '    +-- /usr/include',$0D,$0A
    ;DC.B '    +-- /usr/lib',$0D,$0A
    ;DC.B '    +-- /usr/local',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_12_KEY:
    DC.B    'ls',0
    
GAME_LEVEL_13_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_13_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B 'YOUR BALANCE HAS BEEN UPDATED AGAIN!',$0D,$0A
    DC.B 'EXECUTING SHELL SCRIPTS???',$0D,$0A
    DC.B '1. DELETE this file  ',$0D,$0A
    DC.B '2. EXECUTE burpsulte_free_linux_v1_7_15.sh ',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_13_KEY:
    DC.B    'cat examples.txt',0
    
GAME_LEVEL_14_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage

    
GAME_LEVEL_14_KEY:
    DC.B    'rm examples.txt',0
    
GAME_LEVEL_15_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_15_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B 'burpsulte_free_linux_v1_7_15.sh                                            ',$0D,$0A
    DC.B 'dontdeleteme.txt                                               READTHIS.txt',$0D,$0A
    ;DC.B '',$0D,$0A
    ;DC.B '+-- /usr',$0D,$0A
    ;DC.B '    +-- /usr/bin',$0D,$0A
   ; DC.B '    +-- /usr/include',$0D,$0A
    ;DC.B '    +-- /usr/lib',$0D,$0A
    ;DC.B '    +-- /usr/local',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_15_KEY:
    DC.B    'ls',0
    
GAME_LEVEL_16_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_16_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B 'GUESS WHAT???',$0D,$0A
    DC.B 'YOUR BALANCE HAS BEEN UPDATED AGAIN!',$0D,$0A
    DC.B 'DELETE THOSE FILES YOU DO NOT NEED THEM',$0D,$0A
    DC.B '1. DELETE this file',$0D,$0A
    DC.B '2. OPEN READTHIS.txt  ',$0D,$0A
    DC.B 'AND AS YOU MAY HAVE ALREADY UNDERSTOOD...  ',$0D,$0A
    DC.B '...ANOTHER 15$ ARE WAITING FOR YOU  ',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_16_KEY:
    DC.B    './burpsulte_free_linux_v1_7_15.sh',0
    
GAME_LEVEL_17_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage

    
GAME_LEVEL_17_KEY:
    DC.B    'rm burpsulte_free_linux_v1_7_15.sh',0
    
GAME_LEVEL_18_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_18_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B '                                                                           ',$0D,$0A
    DC.B 'dontdeleteme.txt                                               READTHIS.txt',$0D,$0A
    ;DC.B '',$0D,$0A
    ;DC.B '+-- /usr',$0D,$0A
    ;DC.B '    +-- /usr/bin',$0D,$0A
   ; DC.B '    +-- /usr/include',$0D,$0A
    ;DC.B '    +-- /usr/lib',$0D,$0A
    ;DC.B '    +-- /usr/local',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_18_KEY:
    DC.B    'ls',0
    
GAME_LEVEL_19_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_19_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B '15$ HAS BEEN ADDED TO YOU BALANCE ACCOUNT!',$0D,$0A
    DC.B 'YOU WILL UNDERSTAND WHY YOU NEED THEM VERY SOON!',$0D,$0A
    DC.B 'PRIVATE KEY:1a',$0D,$0A
    DC.B '1. DELETE READTHIS.txt  ',$0D,$0A
    DC.B '2. OPEN dontdeleteme.txt  ',$0D,$0A
    DC.B 'YESSS YOU WILL GET ANOTHER 15$ YOU GOT THAT ',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_19_KEY:
    DC.B    'cat READTHIS.txt',0
    
GAME_LEVEL_20_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage

    
GAME_LEVEL_20_KEY:
    DC.B    'rm READTHIS.txt',0
    
GAME_LEVEL_21_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_21_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B '                                                                           ',$0D,$0A
    DC.B 'dontdeleteme.txt                                                           ',$0D,$0A
    ;DC.B '',$0D,$0A
    ;DC.B '+-- /usr',$0D,$0A
    ;DC.B '    +-- /usr/bin',$0D,$0A
   ; DC.B '    +-- /usr/include',$0D,$0A
    ;DC.B '    +-- /usr/lib',$0D,$0A
    ;DC.B '    +-- /usr/local',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_21_KEY:
    DC.B    'ls',0
    
GAME_LEVEL_22_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_22_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B 'ANOTHER 15$ WELL DONE',$0D,$0A
    DC.B '1. RETRIEVE the content of the web page: ',$0D,$0A
    DC.B 'http://asmproject.com  ',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_22_KEY:
    DC.B    'cat dontdeleteme.txt',0
    
GAME_LEVEL_23_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
GAME_LEVEL_23_OUTPUT_MSG:
    DC.B    $0D,$0A
    DC.B '<!DOCTYPE html>',$0D,$0A
    DC.B '<html>',$0D,$0A
    DC.B '<head>',$0D,$0A
    DC.B '<title>ASM PROJECT</title>',$0D,$0A
    DC.B '</head>',$0D,$0A
    DC.B '<body>',$0D,$0A
    DC.B '<h1>',$0D,$0A
    DC.B 'PRIVATE_KEY: ',0

GAME_LEVEL_23_KEY:
    ;DC.B    '12345ABABA',0  
    DC.B    'curl http://asmproject.com',0   
    

    
GAME_LEVEL_24_MSG:
    DC.B    $0D,$0A   
    DC.B '</h1>',$0D,$0A
    DC.B '<p>lynx http://somewebpage.com</p>',$0D,$0A
    DC.B '</body>',$0D,$0A
    DC.B '</html>',$0D,$0A
    DC.B            $0D,$0A,0
    
GAME_LEVEL_24_KEY:
    DC.B    '1a',0 
    
GAME_LEVEL_25_MSG:
    DC.B    $0D,$0A
    DC.B 'cerber@ubuntuserver:~/Downloads$ ',0
    DC.B    $ff ; garbage
    
    
GAME_LEVEL_25_KEY:
    DC.B    'lynx http://somewebpage.com',0
    
    

    

    
;DC.B    $0D,$0A
;    DC.B 'WILL YOU EVER DOWNLOAD THE FILE ''asmproject.X68'' AGAIN?',$0D,$0A
;    DC.B '1. YES    2.NO',$0D,$0A
;    DC.B 'Choose (1/2):',0
    

    
BALANCE    DC.W    5


PASSWORD_INPUT_MSG DC.W 0

PASSWORD_KEY:
    DC.L    1234
    
NO_BEGINNING_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: PRESS ''Y''',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0 
    
NO_PRESS_ENTER_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: PRESS ENTER',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_1_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: display the current directory',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_2_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: LIST files or directories',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_3_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: REMEMBER you have downloaded something',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_4_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: you HAVE to list it again',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_CHOICE_2_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: you DEFINITELY have NOT learnt the lesson',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
    
NO_GAME_LEVEL_5_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: you NEED to read a file',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
    
NO_GAME_LEVEL_6_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: you have NOT learnt the lesson',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_7_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: delete iamthekey.txt',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_8_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: LIST the directory contents',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_9_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: READ rocket-history.txt',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_10_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: use the command ''CLEAR''',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_11_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: DELETE the previous file that you have opened',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_12_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: LIST the contents please',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_13_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: OPEN examples.txt',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_14_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: DELETE the previous file',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_15_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: LIST files yes obviously...',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_16_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: ./burpsulte_free_linux_v1_7_15.sh',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
    
NO_GAME_LEVEL_17_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: DELETE burpsulte_free_linux_v1_7_15.sh',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
    
NO_GAME_LEVEL_18_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: exactly, LIST the contents',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_19_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: cat READTHIS.txt',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_20_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: DELETE READTHIS.txt',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_21_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: LIST directory contents ',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
    
NO_GAME_LEVEL_22_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: OPEN dontdeleteme.txt',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
    
NO_GAME_LEVEL_23_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: curl http://asmproject.com',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_24_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: PRIVATE KEY:1a',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0
    
NO_GAME_LEVEL_25_MSG:
    DC.B    $0D,$0A   
    DC.B    'HINT: lynx http://somewebpage.com',$0D,$0A 
    DC.B    $0D,$0A 
    DC.B    'ATTEMPTS: ',0
    DC.B    $0D,$0A,0

    
BEGINNING_INPUT_MSG DC.W 0



GAME_LEVEL_1_INPUT_MSG DC.W ' ',0

GAME_LEVEL_2_INPUT_MSG DC.W ' ',0

GAME_LEVEL_3_INPUT_MSG DC.W ' ',0

GAME_LEVEL_4_INPUT_MSG DC.W ' ',0

GAME_LEVEL_5_INPUT_MSG DC.W ' ',0

GAME_LEVEL_6_INPUT_MSG DC.W ' ',0

GAME_LEVEL_7_INPUT_MSG DC.W ' ',0

GAME_LEVEL_8_INPUT_MSG DC.W ' ',0

GAME_LEVEL_9_INPUT_MSG DC.W ' ',0

GAME_LEVEL_10_INPUT_MSG DC.W ' ',0

GAME_LEVEL_11_INPUT_MSG DC.W ' ',0

GAME_LEVEL_12_INPUT_MSG DC.W ' ',0

GAME_LEVEL_13_INPUT_MSG DC.W ' ',0

GAME_LEVEL_14_INPUT_MSG DC.W ' ',0

GAME_LEVEL_15_INPUT_MSG DC.W ' ',0

GAME_LEVEL_16_INPUT_MSG DC.W ' ',0

GAME_LEVEL_17_INPUT_MSG DC.W ' ',0

GAME_LEVEL_18_INPUT_MSG DC.W ' ',0

GAME_LEVEL_19_INPUT_MSG DC.W ' ',0

GAME_LEVEL_20_INPUT_MSG DC.W ' ',0

GAME_LEVEL_21_INPUT_MSG DC.W ' ',0

GAME_LEVEL_22_INPUT_MSG DC.W ' ',0

GAME_LEVEL_23_INPUT_MSG DC.W ' ',0

GAME_LEVEL_24_INPUT_MSG DC.W ' ',0

GAME_LEVEL_25_INPUT_MSG DC.W ' ',0

USER_INPUT_MSG DC.W ' ',0




    
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source













*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
