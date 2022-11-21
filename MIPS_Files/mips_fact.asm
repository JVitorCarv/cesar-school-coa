main:
	addi	$a0, $zero, 5 # Calculates factorial for 5
	jal fact
	
	# Print result	
    	li 	$v0, 1
    	move	$a0, $s1
    	syscall
    	
    	# Exit program
    	li	$v0, 10
    	syscall

fact:
	addi	$sp, $sp, -8 	# Reserves 8 in stack pointer
	sw	$ra, 4($sp) 	# Stores return address
	sw	$a0, 0($sp) 	# Stores $a0
	
	slti	$t0, $a0, 1	# Test for $a0 < 1
	beq	$t0, $zero, L1	# If $a0 >= 1, go to L1
	addi	$s1, $zero, 1	# Return 1 equivalent
	addi	$sp, $sp, 8	# Resets stack
	jr	$ra
	
L1:
	addi	$a0, $a0, -1	# Decrement counter for fact
	jal 	fact		# Call fact as $a0 - 1
	lw	$a0, 0($sp)	# Restore $a0
	lw	$ra, 4($sp)	# Stores return address
	addi	$sp, $sp, 8	# Resets stack
	mul	$s1, $a0, $s1	# Multiply last result to current counter
	jr	$ra