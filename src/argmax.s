.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 32
# =================================================================
argmax:

    # Prologue
    li t0, 1
    blt a1, t0, argmax_exit 
    #max
    lw t1, 0(a0)
    #迭代i
    li t0, 1
    #index
    li t2, 0
loop_start:

    beq t0, a1, loop_end
    addi a0, a0, 4
    lw t3, 0(a0)
    


loop_continue:
    bgt t1, t3 loop_start
    add t1, t3, x0
    add t2, t0, x0
    addi t0, t0, 1
    j loop_start
    


loop_end:
    add a0, t2, x0

    # Epilogue


    ret
argmax_exit:
    li a1, 32
    j exit2