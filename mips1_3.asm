.data
	newline: .asciiz "\n"
	ask: .asciiz "Inform number: "
	sumResult: .asciiz "Result of sum: "
.text
        main:
               #Start $t2 sum as zero
               addi    $t2, $t2, 0
		
		j 	grab
               #If $t2 is different from $t1, goes back to asking x
              	while:
               		bne     $t1, 0, grab
               
               #Print sumResult
               li	$v0, 4
               la	$a0, sumResult
               syscall
               
               #Print sum
              	li	$v0, 1
              	move	$a0, $t2
              	syscall
                
               	li      $v0, 10
		syscall
                        
        grab:
        	#Print ask for integer
                li     $v0, 4
                la	$a0, ask
                syscall
                
                #Grab integer
                li	$v0, 5
                syscall
                
                #Save value into $t1
                move	$t1, $v0
                
                #Increment sum
                add	$t2, $t2, $t1

                #Jump back to while
            	j	while
