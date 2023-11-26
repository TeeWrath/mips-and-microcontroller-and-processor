.data
prompt1: .asciiz "Enter the first integer: "
prompt2: .asciiz "Enter the second integer: "
result1: .asciiz "After swapping, the first integer is: "
result2: .asciiz "After swapping, the second integer is: "
temp: .word 0
input1: .word 0
input2: .word 0
.text
.globl main

main:
    # Prompt the user for the first integer
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read the first integer
    li $v0, 5
    syscall
    sw $v0, input1

    # Prompt the user for the second integer
    li $v0, 4
    la $a0, prompt2
    syscall

    # Read the second integer
    li $v0, 5
    syscall
    sw $v0, input2

    # Swap the integers
    lw $t0, input1
    lw $t1, input2

    # Swap the values using a temporary variable
    sw $t0, temp
    sw $t1, input1
    lw $t2, temp
    sw $t2, input2

    # Display the swapped integers
    li $v0, 4
    la $a0, result1
    syscall
    lw $a0, input1
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, result2
    syscall
    lw $a0, input2
    li $v0, 1
    syscall

    # Exit the program
    li $v0, 10
    syscall
