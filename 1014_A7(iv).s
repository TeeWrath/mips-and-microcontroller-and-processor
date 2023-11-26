
.data
s1: .asciiz "1st line --> This is a...\n2nd line -->...Multiline String\n"
s2: .asciiz "Single line --> Hello World!\n"

.extern foobar 4

.text
.globl main
main:
	li $v0, 4
	la $a0, s1
	syscall
	lw $t1, foobar
	
	li $v0, 4
	la $a0, s2
	syscall
	lw $t1, foobar
	
	jr $ra