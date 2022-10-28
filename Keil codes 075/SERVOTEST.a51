ORG 0000H         
	SJMP MAIN
	
	//zero degrees Delay subroutine
	ORG 0055H
         zero_degrees: 
          MOV TH0, #0FCH 
          MOV TL0, #18H 
          SETB P2.0 ;
          SETB TR0 ;
          WAIT1:JNB TF0, WAIT1 ; 
          CLR TF0 ;
          CLR TR0 ;
		  MOV TH0, #0B5H  
          MOV TL0, #0C7H 
          CLR P2.0 ;
          SETB TR0 ;
          WAIT2:JNB TF0, WAIT2 ;
          CLR TF0 ;
          CLR TR0 ;
           RET
		   
		   
	//Ninety degrees Delay subroutine
		   ORG 0065H
			   ninety_degrees: 
              MOV TH0, #0FAH 
          MOV TL0, #24H 
          SETB P2.0 ;
          SETB TR0 ;
          WAIT3:JNB TF0, WAIT3 ; 
          CLR TF0 ;
          CLR TR0 ;
		  MOV TH0, #0B7H  
          MOV TL0, #0BBH 
          CLR P2.0 ;
          SETB TR0 ;
          WAIT4:JNB TF0, WAIT4 ; 
          CLR TF0 ;
          CLR TR0 ;
               RET 
			   
			   
			   
	   //one_eighty_degrees Delay subroutine

           ORG 0075H
			   one_eighty_degrees:  
                MOV TH0, #0F8H 
          MOV TL0, #30H 
          SETB P2.0 ;
          SETB TR0 ;
          WAIT5:JNB TF0, WAIT5 ;
          CLR TF0 ;
          CLR TR0 ;
		  MOV TH0, #0B9H  
          MOV TL0, #0AFH
          CLR P2.0 ; 
          SETB TR0 ;
          WAIT6:JNB TF0, WAIT6 ; 
          CLR TF0 ;
          CLR TR0 ;
               RET 
			   
			   
			   
	    //Delay Subroutine
		  ORG 0085H
			  delay: 
              MOV R4,#64H ;
              LOOP1:MOV R3,#64H
              LOOP2:MOV R2,#64H
              LOOP3:DJNZ R2,LOOP3
                    DJNZ R3,LOOP2
                    DJNZ R4,LOOP1
                    RET
					
					
		 //Main			
		 ORG 0035H
              MAIN:CLR P2.0;
                   MOV TMOD, #01H ;
				   
                   LCALL zero_degrees
				   LCALL delay
				   
				   LCALL ninety_degrees
				   LCALL delay
				   
				   LCALL one_eighty_degrees
				   LCALL delay
				   
                   SJMP MAIN ;
            END






