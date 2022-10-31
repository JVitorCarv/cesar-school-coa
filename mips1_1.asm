.data
	newline: .asciiz "\n"
.text
        main:
                #Move read N to register $t1
                addi	$t1, $t1, 10

                #Start $t2 counter as zero
                addi    $t2, $t2, 0

                #If $t2 is lower than $t1, executes student
                for:
                        ble     $t2, $t1, inform
                        
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

                #Jump back to while
            	j	for
