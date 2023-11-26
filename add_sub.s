.data
	integer1:	.word 25
	integer2:	.word 25
	integer3:	.word 100
.text
.globl main

main:	lw $t0, integer1
	lw $t1, integer2
	lw $t2, integer3
	add $t3,$t1,$t0
	sub $t4,$t2,$t3

	li $v0, 1
	sub $a0, $t4, $zero
	syscall
	
