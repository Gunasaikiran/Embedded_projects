ORG 0000H
 SJMP START
 
 
 //Lookup table
ORG 4000H
	 DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H, 7FH, 6FH, 0
		 
	
//Main		 
ORG 0035H
	MOV P2, #00H             //Declare as  output
	START: MOV DPTR,#4000H   //Sending First address Data to Dptr 
    REPEAT:CLR A;            //Clearing Accumalator
           MOVC A, @A+DPTR   //Sending To A
           MOV P2,A          //Moving port 2 
           ACALL DELAY       //Calling delay
           INC DPTR          //for next address
           CJNE A,0,REPEAT   //comparing wether Database ends are not by 0
           SJMP START        //repeat

//Delay of 1 sec 
DELAY: MOV R0,#08H
       LP2 : MOV R1,#0FFH
       LP1 : MOV R2,#0FFH
       LP3: DJNZ R2,LP3
            DJNZ R1,LP1
            DJNZ R0,LP2
RET

END