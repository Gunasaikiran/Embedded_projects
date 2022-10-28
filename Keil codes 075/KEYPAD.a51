ORG 0000H
MOV DPTR,#LUT // moves starting address of LUT to DPTR
MOV A,#11111111B // loads A with all 1's
MOV P0,#00H // initializes P0 as output port

BACK:MOV P1,#0FFH 
     CLR P1.0         //For low of row1
     JB P1.4,NEXT1  // switch 1 presses
     MOV A,#0D   // For displaying 0
     ACALL DISPLAY  // calls DISPLAY subroutine
	 
	 
	 
// switch 2 presses	 
NEXT1:JB P1.5,NEXT2 
      MOV A,#1D
      ACALL DISPLAY
	  
	  
	  
// switch 3 presses	  
NEXT2:JB P1.6,NEXT3
      MOV A,#2D
      ACALL DISPLAY
	  
	  
	  
// switch 4 presses	  
NEXT3:JB P1.7,NEXT4
      MOV A,#3D
      ACALL DISPLAY
	  
	  
	  
// Row 2 is 0
//switch 1 presses
NEXT4:SETB P1.0
      CLR P1.1
      JB P1.4,NEXT5
      MOV A,#4D
      ACALL DISPLAY
	  
	  
// switch 2 presses	  
NEXT5:JB P1.5,NEXT6
      MOV A,#5D
      ACALL DISPLAY
	  
	  
	  
// switch 3 presses	  
NEXT6:JB P1.6,NEXT7
      MOV A,#6D
      ACALL DISPLAY
	  
	  
	  
// switch 4 presses	  
NEXT7:JB P1.7,NEXT8
      MOV A,#7D
      ACALL DISPLAY
	  
	  
	  
// Row 3 is low
// switch 1 presses
NEXT8:SETB P1.1
      CLR P1.2
      JB P1.4,NEXT9
      MOV A,#8D
      ACALL DISPLAY
	  
	  
	  
	  
// switch 2 presses	  
NEXT9:JB P1.5,NEXT10
      MOV A,#9D
      ACALL DISPLAY
	  
	  
	  
	  
// switch 3 presses	  
NEXT10:JB P1.6,NEXT11
       MOV A,#10D
       ACALL DISPLAY
	   
	   
	   
// switch 4 presses	   
NEXT11:JB P1.7,NEXT12
       MOV A,#11D
       ACALL DISPLAY
	   
	   
	   
	   
// Row 4 is low
// switch 1 presses
NEXT12:SETB P1.2
       CLR P1.3
       JB P1.4,NEXT13
       MOV A,#12D
       ACALL DISPLAY
	   
	   
// switch 2 presses	   
NEXT13:JB P1.5,NEXT14
       MOV A,#13D
       ACALL DISPLAY
	   
	   
// switch 3 presses	   
NEXT14:JB P1.6,NEXT15
       MOV A,#14D
       ACALL DISPLAY
	   
	   
// switch 4 presses	   
NEXT15:JB P1.7,BACK
       MOV A,#15D
       ACALL DISPLAY
	   
       LJMP BACK
	   
	   
// Display Subroutine
DISPLAY:MOVC A,@A+DPTR 
        MOV P2,A       
        RET
		
		
// Look up table starts here
LUT: DB 3FH
     DB 06H
     DB 5BH
     DB 4FH
     DB 66H
     DB 6DH
     DB 7DH
     DB 07H
     DB 7FH
     DB 6FH
     DB 77H
     DB 7FH
     DB 39H
     DB 3FH
     DB 79H
     DB 71H
     END