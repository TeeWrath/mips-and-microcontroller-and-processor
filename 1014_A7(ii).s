.data
	integer1:	.word 4
	integer2:	.word 5
	integer3:	.word 5
.text
.globl main

main:	lw $t0, integer1
	lw $t1, integer2
	lw $t2, integer3
	mul $t3,$t0,$t1
	mul $t4,$t2,$t3

	li $v0, 1
	sub $a0, $t4, $zero
	syscall
	