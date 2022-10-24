.data
	informGrade1: .asciiz "Inform grade 1: "
	informGrade2: .asciiz "Inform grade 2: "
	informFrequency: .asciiz "Inform frequency: "
	
	calculatedAverage: .asciiz "AVERAGE: "
	studentApproved: .asciiz "\nAPPROVED"
	studentFailed: .asciiz "\nFAILED"
	
	minimumGrade: .double 7.0
	minimumFrequency: .double 75.0
	two: .double 2.0

.text
	main:
		#Print informGrade1
		li	$v0, 4
		la	$a0, informGrade1
		syscall
	
		#Get grade1 from user
		li 	$v0, 7
		syscall
	
		#Move grade1 to $f2
		mov.d	$f2, $f0
	
		#Print informGrade2
		li	$v0, 4
		la	$a0, informGrade2
		syscall
	
		#Get grade2 from user
		li	$v0, 7
		syscall
	
		#Move grade2 to $f4
		mov.d	$f4, $f0
	
		#Display informFrequency
		li	$v0, 4
		la	$a0, informFrequency
		syscall
	
		#Get frequency from user
		li	$v0, 7
		syscall
	
		#Move frequency to $f6
		mov.d 	$f6, $f0
	
		#Load minimumGrade, minimumFrequency, two
		l.d 	$f26, minimumFrequency
		l.d	$f28, minimumGrade
		l.d	$f30, two
		
 		#Sum $f2 and $f4 and store it in $f14
 		add.d	$f14, $f2, $f4
 	
 		#Store average in $f2
 		div.d	$f2, $f14, $f30
 		
 		#Print calculatedAverage
 		li	$v0, 4
 		la	$a0, calculatedAverage
 		syscall
 		
 		#display $f2
 		li	$v0, 3
 		add.d	$f12, $f2, $f10
 		syscall
 		
 		#Compare $f2 to minimum grade
 		c.lt.d 	$f2, $f28
 		 bc1t fail
 		 bc1f checkFrequency
 		
 		#End program
 		li 	$v0, 10
 		syscall
 		
 	checkFrequency:
 		#Check if frequency is not minimum
 		c.lt.d	$f6, $f26
 		bc1t 	fail
 		bc1f 	approve
 		 
 	fail:
 		#Print failed
 		li	$v0, 4
 		la	$a0, studentFailed
 		syscall
 		
 		#End program
 		li 	$v0, 10
 		syscall
 		 	
 	approve:
 		#Print approved
 		li	$v0, 4
 		la	$a0, studentApproved
 		syscall
 		
 		#End program
 		li 	$v0, 10
 		syscall
 		
li 	$v0, 10
syscall
