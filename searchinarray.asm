.data
array: .word 5, 10, 15, 20, 25, 30, 35, 40, 45, 50
target: .word 25
result: .word 0
.text
.globl main

main:
    lw $t0, target
    la $t1, array
    li $t2, 10

    search_loop:
        lw $t3, 0($t1)
        beq $t3, $t0, element_found
        addi $t1, $t1, 4
        addi $t2, $t2, -1
        bnez $t2, search_loop

    element_not_found:
        li $t4, -1
        sw $t4, result
        j exit

    element_found:
        li $t4, 1
        sw $t4, result

    exit:
        # Exit the program
        li $v0, 10
        syscall
