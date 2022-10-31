.data
	informNumber: .asciiz "Inform number: "
	result: .asciiz "Result: "
.text
	main:
		#Print informNumber
    		li 	$v0, 4                   
    		la 	$a0, informNumber
    		syscall
		
		#Get number
   		li 	$v0, 5                   
    		syscall
		
		#Store read value into $t1
    		move	$t1, $v0
    		
    		#Load 1 into $t2
    		addi 	$t2, $zero, 1
    		
    		#Pass read value to $a0
    		move 	$a0, $t1        
    		jal 	fact
		
		#Print result
		li	$v0, 4
		la	$a0, result
		syscall
		
    		li 	$v0, 1                   
    		add 	$a0, $v1, $zero
    		syscall

    		j	exit

	fact:	
		#Update stack
    		addi 	$sp, $sp, -8           
    		sw 	$a0, 0($sp)              
    		sw 	$ra, 4($sp)

    		bne 	$a0, $t2, recursion     
    		add 	$v1, $t2, $zero		
    		
    		#Update stack
    		addi 	$sp, $sp, 8            
    		jr 	$ra

    	recursion: 
        	addi 	$a0, $a0, -1      
        	jal 	fact
		
		#Return from fact
        	lw 	$a0, 0($sp)          
        	lw 	$ra, 4($sp)
        	addi 	$sp, $sp, 8        
        	mul 	$v1, $a0, $v1 
		
        	jr 	$ra
        
        exit:
        	li 	$v0, 10
        	syscall