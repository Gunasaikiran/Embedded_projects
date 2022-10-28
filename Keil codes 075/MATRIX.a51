ORG 0000H
SJMP START
ORG 0035H
START: MOV R1, #02H
MOV R2, #04H
MOV R3, #01H
MOV R4, #03H
MOV A, R1
MOV B, R4
MUL AB ; 1 1 * 2 2
MOV 45H, B
MOV 46H, A
MOV A, R2
MOV B, R3
MUL AB ; 1 2 * 2 1
MOV 47H, B
MOV 48H, A
CLR C
CLR A
MOV A, 45H
SUBB A, 47H
MOV 50H, A
MOV A, 46H
SUBB A, 48H
MOV 51H,A ; 16 bit determinant stored at 51H and 50H respectively
MOV R0,51H
MOV R1,50H
MOV R2,#00H
MOV R3,#00H
MOV R4,#00H
CLR A
END