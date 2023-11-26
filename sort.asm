.data
array: .word 5, 10, 3, 8, 2, 7, 1, 6, 4, 9
.text
.globl main

main:
    la $t0, array
    li $t1, 10

    outer_loop:
        li $t2, 0

        inner_loop:
            lw $t3, 0($t0)
            lw $t4, 4($t0)

            bge $t3, $t4, no_swap

            sw $t4, 0($t0)
            sw $t3, 4($t0)

            no_swap:

            addi $t0, $t0, 4
            addi $t2, $t2, 1
            bne $t2, $t1, inner_loop

        subi $t1, $t1, 1
        beqz $t1, done
        la $t0, array
        j outer_loop

    done:
        # Exit the program
        li $v0, 10
        syscall
