*-----------------------------------------------------------
* Title      :  practical_06_part2.X68
* Written by :  Temur Rustamov
* Date       :  26/02/2024
* Description:  Conditional Branches and Control Structures
*-----------------------------------------------------------
    ORG    $1000

START:                  ; first instruction of program
    MOVE    #0,D0   D0 = task number 0
    LEA     TEXT,A1 A1 = address of string to display.
    TRAP    #15     Activate input/output task.
    
    MOVE    #1,D0   D0 = task number 1
    LEA     TEXT,A1 A1 = address of string to display.
    TRAP    #15     Activate input/output task.
    
    MOVE    #2,D0   D0 = task number 2
    LEA     TEXT,A1 A1 = address of string to display.
    TRAP    #15     Activate input/output task.
    
    MOVE.L  #15,D1   ; Move the number you want to display into D1
    MOVE.W  #3,D0    ; Set the task number to 3
    TRAP    #15      ; Activate the task
    
    MOVE.W  #4,D0    ; Set the task number to 4 for number input
    TRAP    #15      ; Activate the task
    
    MOVE     #5,D0   ; Set the task number to 5 for character input
    TRAP     #15     ; Activate the task
    
    MOVE.B  #61,D1   ; Move the number you want to display into D1
    MOVE.W  #6,D0    ; Set the task number to 6
    TRAP    #15      ; Activate the task
    
    
    MOVE.W  #7,D0    ; Set the task number to 7
    TRAP    #15      ; Activate the task
    
    MOVE    #8,D0   D0 = task number 8
    LEA     TEXT,A1 A1 = address of string to display.
    TRAP    #15     Activate input/output task.
    
    MOVE    #9,D0   D0 = task number 9
    LEA     TEXT,A1 A1 = address of string to display.
    TRAP    #15     Activate input/output task.
    
    MOVE    #10,D0   D0 = task number 10
    LEA     TEXT,A1 A1 = address of string to display.
    TRAP    #15     Activate input/output task.
    
    MOVE    #11,D0   D0 = task number 11
    LEA     TEXT,A1 A1 = address of string to display.
    TRAP    #15     Activate input/output task.
    
    MOVE.L  #12,D1   ; Move the number you want to display into D1
    MOVE.W  #3,D0    ; Set the task number to 12
    TRAP    #15      ; Activate the task
    
    MOVE.W  #13,D0    ; Set the task number to 13 for number input
    TRAP    #15      ; Activate the task
    
    MOVE     #14,D0   ; Set the task number to 14 for character input
    TRAP     #15     ; Activate the task
    
    MOVE.B  #15,D1   ; Move the number you want to display into D1
    MOVE.W  #6,D0    ; Set the task number to 15
    TRAP    #15      ; Activate the task
    
    
    MOVE.W  #16,D0    ; Set the task number to 16
    TRAP    #15      ; Activate the task
    
    MOVE    #17,D0   D0 = task number 17
    LEA     TEXT,A1 A1 = address of string to display.
    TRAP    #15     Activate input/output task.
    
    MOVE.L  #18,D1   ; Move the number you want to display into D1
    MOVE.W  #3,D0    ; Set the task number to 18
    TRAP    #15      ; Activate the task
    
    MOVE.W  #19,D0    ; Set the task number to 19 for number input
    TRAP    #15      ; Activate the task
    
    MOVE     #20,D0   ; Set the task number to 20 for character input
    TRAP     #15     ; Activate the task
    
    MOVE.B  #21,D1   ; Move the number you want to display into D1
    MOVE.W  #6,D0    ; Set the task number to 21
    TRAP    #15      ; Activate the task
    
    
    MOVE.W  #22,D0    ; Set the task number to 22
    TRAP    #15      ; Activate the task

    
    
    

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here
TEXT    DC.B    'Hello World',0   Null terminated string.


    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
