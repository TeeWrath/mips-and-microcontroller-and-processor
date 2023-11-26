.data
str: .asciiz "Palindrome"
not_palindrome: .asciiz "Not Palindrome"
input: .space 20
len: .word 0
.text
.globl main
main:
    # Read a string from the user
    li $v0, 8
    la $a0, input
    li $a1, 20
    syscall

    # Find the length of the input string
    move $t0, $a0
    find_length:
        lb $t1, 0($t0)
        beqz $t1, check_palindrome
        addi $t0, $t0, 1
        j find_length

    check_palindrome:
        # Initialize the start and end indices
        la $t0, input
        la $t1, input

        addi $t1, $t1, -1

        loop:
            # Load characters from the start and end of the string
            lb $t2, 0($t0)
            lb $t3, 0($t1)

            # Compare the characters
            beqz $t2, is_palindrome
            bne $t2, $t3, not_palindrome

            addi $t0, $t0, 1
            addi $t1, $t1, -1
            j loop

        is_palindrome:
            # Print "Palindrome" if it's a palindrome
            li $v0, 4
            la $a0, str
            syscall
            j exit

        not_palindrome:
            # Print "Not Palindrome" if it's not a palindrome
            li $v0, 4
            la $a0, not_palindrome
            syscall

    exit:
        li $v0, 10
        syscall
