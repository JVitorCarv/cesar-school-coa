.data

prompt_devident: .asciiz "\n Enter your Devident :\n "
prompt_devider: .asciiz "Enter your Devider :\n "
print_quotient: .asciiz "Your quotient is : "
print_reminder: .asciiz "\n Your Reminder is: "

.text
.globl main
main:

l4: la $a0, prompt_devident
li $v0,4
syscall

li $v0,5        
syscall        
move $t0,$v0        

la $a0, prompt_devider        
li $v0,4        
syscall        

li $v0,5        
syscall        
move $t1, $v0        

ori $t2,  $zero,0        
ori $t3,  $zero,0        
ori $t4,  $zero,0        
ori $t5,  $zero,32        
loop: sll $t2,$t2,1
bgez $t0,l1
ori $t2,$t2,1

l1: sll $t0,$t0,1
subu $t3,$t2,$t1
bgez $t3,l2

l3: addi $t4,$t4,1
beq $t4,$t5,next
j loop

l2: move $t2,$t3
ori $t0,1
j l3

next: la $a0, print_quotient
li $v0,4
syscall

    move  $a0,$t0               
    li    $v0,1            
syscall            

la $a0, print_reminder            
li $v0,4            
syscall            

    move  $a0,$t2               
    li    $v0,1            
syscall            
j l4            

li $v0, 10            
syscall            