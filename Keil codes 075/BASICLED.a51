ORG 0000H 
  SJMP START 


ORG 0035H
  START: MOV TMOD, 01H 
        REPEAT: MOV TH0, #0FEH
                MOV TL0, #70H
                CPL P1.0 
                SETB TR0 
                CHECK: JNB TF0, CHECK 
                       CLR TR0 
                       CLR TF0 
                       JMP REPEAT 
END
