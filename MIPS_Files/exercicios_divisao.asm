.data
	newline: .asciiz "\n"
	bug: .asciiz "Debug Print\n"
.text
        main:
                # Start counters for for
                addi	$t1, $t1, 33
                addi    $t2, $t2, 0
                
                addi	$t3, $zero, 11 	# Remainder
                addi	$t4, $zero, 2 	# Divisor
                sll	$t4, $t4, 16	# Initialize half of least significative bits as zero
                addi	$t8, $zero, 0	# Quotient

                # If $t2 is lower than $t1, executes divide
                for:
                        blt      $t2, $t1, divide
                        
               	# Print Quotient
               	li	$v0, 1
               	move	$a0, $t8
               	syscall
                
                # Exit program
                li      $v0, 10
		syscall
                        
        divide:
        	# Subtract the divisor register from the remainder
        	sub	$t3, $t3, $t4
        	
        	# Test remainder
                bge	$t3, 0, firstRoutine
                blt 	$t3, 0, secondRoutine
	
	firstRoutine:
		sll	$t8, $t8, 1	# Shift the quotient register to the left
		addi	$t8, $t8, 1	# Set rightmost bit to 1
		j	rest
		
	secondRoutine:
		add	$t3, $t3, $t4	# Restore original value
		sll	$t8, $t8, 1	# Shift quotient register to the left
		j 	rest
		
	rest:
		srl	$t4, $t4, 1	# Shift Divisor register right 1 bit 
		addi	$t2, $t2, 1
            	j	for
		
