.data
	integer1:	.word 6
	integer2:	.word 4
	integer3:	.word 12
.text
.globl main

main:	lw $t0, integer1
	lw $t1, integer2
	lw $t2, integer3
	mul $t3,$t0,$t1
	div $t4,$t3,$t2

	li $v0, 1
	sub $a0, $t4, $zero
	syscall
