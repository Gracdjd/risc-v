.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 (int*) is the pointer to the array
#	a1 (int)  is the # of elements in the array
# Returns:
#	None
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 32
# ==============================================================================
relu:
    # Prologue
    li t1, 1
    blt a1, t1, exit_relu

    add t0, x0, x0
    #sll t1, t1, 2
loop_start:
    beq t0, a1, loop_end
    

loop_continue:
    addi t0, x0, 1
    
    
    lw t2, 0(a0)
    addi a0, x0, 4
    bgt t2, x0, loop_start
    sw x0, -4(a0) 

exit_relu:
    li a1, 32
    j exit2

loop_end:


    # Epilogue

    
	ret
