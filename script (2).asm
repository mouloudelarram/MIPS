.data
	str: .space 100
.text
	la $a0, str
	li $a1,15
	li $v0, 8
	li $s0,-48 # asscii de 0
	li $s1, 10
	syscall
	
	loop:
	beq $t0,$s1,fin
	li $v0, 1
	lb $t0,0($a0)
	add $t0,$t0,-48
	addi $a0,$a0,1
	addi $s6,$s6,1
	syscall
	
	j loop
	
	fin:
	