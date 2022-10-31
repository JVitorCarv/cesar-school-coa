.data
	helloWorld: .asciiz "Hello World"

.text
	#Print Hello World
	li 	$v0, 4
	la 	$a0, helloWorld
	syscall

li $v0, 10
syscall
