.data
	newline: .asciiz "\n"
	bug: .asciiz "Bug\n"
	insertMultiplicand: .asciiz "Insert multiplicand: "
	insertMultiplier: .asciiz "Insert multiplier: "
	printResult: .asciiz "Result: "
.text
        main:
                # Start $t1 as 32
                addi	$t1, $t1, 32

                # Start $t2 counter as zero
                addi    $t2, $t2, 0
                
                # Print insert multiplicand
                li	$v0, 4
                la	$a0, insertMultiplicand
                syscall
                
                # Retrieve multiplicand
                li	$v0, 5
                syscall
                move	$t3, $v0
                
                # Print insert multiplier
                li	$v0, 4
                la	$a0, insertMultiplier
                syscall
                
                # Retrieve multiplier
                li	$v0, 5
                syscall
                move	$t4, $v0
                
          	# Start $t5 as 1
          	addi	$t5, $zero, 1
          	addi	$t7, $zero, 0

                # If $t2 is lower than $t1, executes multiply
                for:
                        blt      $t2, $t1, multiply
                        
               	# Print total
               	li	$v0, 4
               	la	$a0, printResult
               	syscall
               	
               	li	$v0, 1
               	move	$a0, $t7
               	syscall
                
                # Exit program
                li      $v0, 10
		syscall
                        
        multiply:
               	# Get mask of first digit from Multiplier
               	and	$t6, $t4, $t5
                beq	$t6, $t5, addToTotal
                bne 	$t6, $t5, rest
	
	addToTotal:
		add 	$t7, $t7, $t3
		j	rest
		
	rest:
		# Shift the Multiplicand register left 1 bit
                sll	$t3, $t3, 1
                
                # Shift the Multiplier register right 1 bit
                srl	$t4, $t4, 1
                
                #Increment $t2
                addi    $t2, $t2, 1

                #Jump back to for
            	j	for
		