
;Compliment

jmp start
start: nop
nop: LDA 9000H
CMA
STA 9001H
hlt
