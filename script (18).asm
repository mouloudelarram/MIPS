.data 
	message: .asciiz "entre un entier: "
.text
	la $a0,message
	li $v0,4
	syscall
	li $v0,5
	syscall
	add $s0,$s0,$v0
	
	la $a0,message
	li $v0,4
	syscall
	li $v0,5
	syscall
	add $s0,$s0,$v0
	
	la $a0,message
	li $v0,4
	syscall
	li $v0,5
	syscall
	add $s0,$s0,$v0
	
	move $a0, $s0
	li $v0,1
	syscall