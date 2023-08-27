.data
array:  .word 4, 50, 61, 77 ,8 ,99
length: .word 6
.text
.globl main

main:
addi $sp, $sp, -24
sw $t0, 0($sp)
sw $t1, 4($sp)
sw $t2, 8($sp)
sw $t3, 12($sp)
sw $t4, 16($sp)
sw $t5, 20($sp)

    la $a0, array           # load the base address
    lw $a1, length          # load the length of the array

    jal Selection_Sort      # Sort the array using Sel_Sort procedure
  
    jal Top_rank_V2         # Find the maximum value in the array (if array is already sorted execute V2, if not execute Top_Rank)
    move $t6, $v0           # Move the maximum value to $t8
    
    jal Top_rank            # Find the maximum value in the array (if array is not sorted)
    move $t7, $v0           # Move the maximum value to $t6 (if array is not sorted)

    jal Semester_Abroad # find new array with values greater than or equal to 70
    move $t8, $v0           # New starting index in t9
    move $t9, $v1           # nr of elements in new array in t7

    j Exit



Selection_Sort:

    addi $sp, $sp, -4       # push space on the stack
    sw $ra, 0($sp)          # Save the return address
    addi $t0, $zero, 0      # Initialize outer loop counter

outer_loop:

    beq $t0, $a1, done      # If outer loop counter equals the number of elements, we're done
    addi $t1, $zero, 0      # Initialize inner loop counter

inner_loop:

    addi $t9, $a1, -1       #can't reach last element because in comparison will go out of array
    beq $t1, $t9, next      # If inner loop counter equals the number of elements, move next in outer loop
    sll $t2, $t1, 2         # Calculate the offset for array at index t1 
    add $t2, $t2, $a0       # find address of current element
    lw $t3, 0($t2)          # Load the value of the current element
    addi $t4, $t1, 1        # Do the same for element after
    sll $t5, $t4, 2         # Calculate the offset for array at index t4
    add $t5, $t5, $a0       # find address of current element
    lw $t6, 0($t5)          # Load the value of the next element
    ble $t3, $t6, increment # If less than, change inner loop counter
    sw $t6, 0($t2)          # swap
    sw $t3, 0($t5)          # swap
    j increment            #increment the j

increment:

    addi $t1, $t1, 1        # Increment inner loop counter
    j inner_loop            # Continue inner loop

next:

    addi $t0, $t0, 1        # Increment outer loop counter
    j outer_loop            # go to outer loop again

done:

    lw $ra, 0($sp)          # Load back the return address
    addi $sp, $sp, 4        # pop space from the stack
    jr $ra                  # Return to the main



Top_rank:

    addi $sp, $sp, -4       # push space on the stack
    sw $ra, 0($sp)          # Save the return address
    lw $t0, 0($a0)          # assume that first element is the max
    addi $t1, $a0, 4        # increase t1 to get next element in the array
    addi $v0, $zero, 0      # Initialize $v0 to store the maximum value, initialize with 0
    addi $t3, $a1, 0        # loop counter

loop2:

    beq $t3, $zero, end2    # If the number of elements is zero, end 
    lw $t2, 0($t1)          # Load the value of the current element
    ble $t2, $t0, increment2 # If current element is less than or equal to current maximum, got to increment
    move $t0, $t2           # If it is bigger, then update the maximum value
    j increment2            # Go to next element

increment2:

    addi $t1, $t1, 4        # Increment loop counter by 4 (bytes)
    addi $t3, $t3, -1       # Decrement the number of elements, update loop counter
    j loop2                 # Continue loop

end2:

    move $v0, $t0           # Move the maximum value to $v0
    lw $ra, 0($sp)          # Restore the return address
    addi $sp, $sp, 4        # Release space on the stack
    jr $ra                  # Return to the caller


Top_rank_V2:

   addi $t1, $a1, -1        #find before to last index
   sll $t1, $t1, 2          #shift to get address (bytes)
   add $t1, $a0, $t1        #find exact address
   lw $t2, 0($t1)           #load the max value from the array
   move $v0, $t2            #return the max
   jr $ra                   #go to the main


Semester_Abroad:

    addi $v0, $zero, 0
    add $v0, $v0, $a0       # if no element is less than 70, then return original array
    add $v1, $a1, $zero    # if no element is less than 70, then return original length
    addi $sp, $sp, -4       # push space on the stack
    sw $ra, 0($sp)          # Save the return address
    addi $t0, $zero, 0      # Initialize loop counter
    addi $t3, $a1, 0        #to calculate nr of elements in new array

loop3:

    beq $t0, $a1, end3      # if end of array is reached, go to end
    sll $t1, $t0, 2         # Calculate the offset for array index at i
    add $t1, $t1, $a0       # Calculate the address of the element
    lw $t2, 0($t1)          # Load the value from the array
    blt $t2, 70, next3      # If less than 70, go to next and increment array counter
    move $v0, $t1           # If not, t1 is the new starting index 
    move $v1, $t3           # new array length in v1
    j end3                  # End the loop



next3:
    addi $t0, $t0, 1        # Increment loop counter
    addi $t3, $t3, -1       # length of new array is one less element
    j loop3                 # Continue loop

end3:

    lw $ra, 0($sp)          # Restore the return address
    addi $sp, $sp, 4        # pop space from the stack
    jr $ra                  # Return to the caller


   Exit:
   lw $t0, 0($sp)
   lw $t1, 4($sp)
   lw $t2, 8($sp)
   lw $t3, 12($sp)
   lw $t4, 16($sp)
   lw $t5, 20($sp)
   addi $sp, $sp, 24

   

