.text
	main:
		# Store 10 to $t1
		addi	$t1, $t1, 10
		
		# Store 3 to $t2
		addi	$t2, $t2, 3
		
		# Store 1 to $t3
		addi	$t3, $t3, 1
		
		# And bitwise to $t4 between 1 and 10
		and	$t4, $t3, $t1
		
		# And bitwise to $t5 between 1 and 3
		and	$t5, $t3, $t2
		
		# Print results in bitwise registers
		li	$v0, 1
		move	$a0, $t4
		syscall
		
		li	$v0, 1
		move	$a0, $t5
		syscall
			
		# Exit program
		li	$v0, 10
		syscall