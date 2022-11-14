
.data 
	str1: .asciiz " enter un entier : "
	str2: .asciiz " La sommme de ses chiffres est :"
	buf : .space 20
.text
	main:
		la $a0,str1
		li $v0,4
		syscall
		la $a0,buf
		li $a1,20
		li $v0,8
		syscall
		li $t2,10
		move $t0,$0
		
	debut:
		lb $t1,0($a0)
		beq $t1,$t2,fin
		addi $t1,$t1,-48
		add $t0,$t0,$t1
		addi $a0,$a0,1
		j debut
	fin:
		la $a0,str2
		li $v0,4
		syscall
		move $a0,$t0
		li $v0,1
		syscall
		li $v0,10
		syscall
		