
;Two's Compliment

jmp start
start: nop
nop: LDA 9000H
CMA
INR a
STA 9001H
hlt
