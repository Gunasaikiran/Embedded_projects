ORG 0000H 
SJMP START 

//Delay subroutine
DELAY: 
      MOV TMOD, #01H 
      MOV TH0,#00H 
      MOV TL0,#00H  
      SETB TR0  
      CHECK: JNB TF0, CHECK  
             CLR TR0 
             CLR TF0  
RET 


//Main Program
ORG 0035H
   START: MOV R0,#08H  
          MOV A,#00H 
          LABEL: SETB C 
                 RLC A   //Rotate left with carry to set bits
                 MOV P1,A 
                 ACALL DELAY  
                 ACALL DELAY 
                 DJNZ R0, LABEL 
JMP START  
END