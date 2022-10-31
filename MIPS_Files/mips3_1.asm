.data
	messageGrab: .asciiz "Inform AV1: "
	messageMinimumGrade: .asciiz "Minimum Grade: "
	messageNotPossible: .asciiz "Not possible to be approved"

.text
	main:	
		#Print "Inform AV1: "
		li	$v0, 4
		la	$a0, messageGrab
		syscall
		
		#Grab AV1 grade
		li	$v0, 5
		syscall
		
		#Store $v0 into $a0
		move 	$a0, $v0
		addi	$a1, $zero, 14
		jal	calculate
		
		#Print "Minimum Grade: "
		li	$v0, 4
		la	$a0, messageMinimumGrade
		syscall
		
		#Print the minium
		li	$v0, 1
		move	$a0, $a1
		syscall
		
		#Terminate program
		j 	exit
		
	calculate:
		sub	$a1, $a1, $a0
		jr	$ra
		
	exit:
		li	$v0, 10
		syscall