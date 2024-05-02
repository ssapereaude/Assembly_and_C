*-----------------------------------------------------------
* Title      :  practical_06_part4.X68
* Written by :  Temur Rustamov
* Date       :  26/02/2024
* Description:  Conditional Branches and Control Structures
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

   LEA     $4000, SP        ; Load Effective Address: Initialize the stack pointer to address $4000
   
   MOVE.B  #1, -(SP)        ; push 1 onto the stack
   MOVE.B  #2, -(SP)        ; push2 onto the stack
   MOVE.B  #3, -(SP)        ; push3 onto the stack
   MOVE.B  #4, -(SP)        ; push 4 onto the stack
  
   MOVE.B  (SP)+, D1        ; pop the top value 4 off the stack into D1 
   MOVE.B  (SP)+, D1        ; pop the next value 3 off the stack into D1 
  MOVE.B  (SP)+, D1         ; pop the next value 2 off the stack into D1 
   MOVE.B  (SP)+, D1        ; pop the next value 1 off the stack into D1 
  


    

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source
                        ; stack pointer used for parameter passing to functions/subroutines so the parameters can be pushed on the stack in the fcalling function and then popped
                        ; also for saving and restoring registers before calling a subroutine a program pushes the current state of certain registers onto the stack to preserve their values

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
