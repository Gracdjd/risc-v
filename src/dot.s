.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 32
# - If the stride of either vector is less than 1,
#   this function terminates the program with error code 33
# =======================================================
dot:
    # Prologue
    li t0, 1
    blt a2, t0, exit_32
    blt a3, t0, exit_33
    blt a4, t0, exit_33
    #sum
    li t1, 0

    sll a3, a3, 2
    sll a3, a3, 2
    #t0 作为temp
loop_start:

    bge t0, a2, loop_end

    lw t2, 0(a0)
    lw t3, 0(a1)

    add a0, a0, a3
    add a1, a1, a4

    mul t4, t2, t3
    add t1, t1, t4
    j loop_start

loop_end:

    add a0, t1, x0
    # Epilogue

    
    ret

exit_32:
    li a1, 32
    j exit2

exit_33
    li a1, 33
    j exit2