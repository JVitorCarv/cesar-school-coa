.data
	informCelsius: .asciiz "Inform celsius: "
	messageResult: .asciiz "Conversion result: "
	
	nine: .double 9.0
	five: .double 5.0
	sum: .double 32.0

.text
	#Print informCelsius
	li $v0, 4
	la $a0, informCelsius
	syscall
	
	#Get celsius value from user
	li 	$v0, 7
	syscall
	
	#Load nine and five
	l.d 	$f4, nine
	l.d	$f6, five
	l.d	$f14, sum
	
	#Multiply $f0 by 9
	mul.d 	$f2, $f0, $f4
	
	#Divide $f2 by 5
	div.d 	$f8, $f2, $f6
	
	#Add $f14 to $f8 and store it in $f2
	add.d	$f2, $f8, $f14
	
	#Print messageResult
	li	$v0, 4
	la	$a0, messageResult
	syscall
	
	#Display result, stored in $f2
	li	$v0, 3
	add.d	$f12, $f2, $f10
	syscall
 
li $v0, 10
syscall
