.data
	newline: .asciiz "\n"
.text
        main:
                # Start $t1 as 32
                addi	$t1, $t1, 32

                # Start $t2 counter as zero
                addi    $t2, $t2, 0
                
                # Start $t3 as 4
                addi	$t3, $t3, 4

                # If $t2 is lower than $t1, executes student
                for:
                        blt      $t2, $t1, inform
                
                # Exit program
                li      $v0, 10
		syscall
                        
        inform:
        	#Print $t2
                li      $v0, 1
                move    $a0, $t2
                syscall
                
                #Print newline
                li	$v0, 4
                la	$a0, newline
                syscall
                
                #Increment $t2
                addi    $t2, $t2, 1

                #Jump back to for
            	j	for
