@R0
D=M
@END
D;JLE 
@n
M=D
@SCREEN
D=A
@addr
M=D
(LOOP)
@addr
A=M
M=-1
@addr
D=M
@32
D=D+A
@addr
M=D
@n
MD=M-1
@LOOP
D;JGT
(END)
@END
0;JMP