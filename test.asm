.data
	strA: .space 20
	strB: .space 20
	message_1: .asciiz "enter string 1: "
	message_2: .asciiz "enter string 2: "
	message_3: .asciiz "Le string 1 maintenat est :"
.text
	main:
	
		la $a0,message_1
		li $v0,4
		syscall
		la $a0,strA
		li $a1,10
		li $v0,8
		syscall
		move $t0,$a0
		
		la $a0,message_2
		li $v0,4
		syscall
		la $a0,strB
		li $a1,10
		li $v0,8
		syscall
		move $t1,$a0
		
		
		move $a0,$t0
		move $a1,$t1
		jal  strcpy
			move $t0,$a0
			la $a0,message_3
			li $v0,4
			syscall
			move $a0,$t0
			li $v0,4
			syscall
		#exit
		li $v0,10
		syscall
	strcpy:
		addi $sp,$sp,-8
		sw $ra, 0($sp)
		sw $a0, 4($sp)
		
		loop:
			lb $t0,0($a1)
			sb $t0,0($a0)
			li $t1,0
			beq $t0,$t1,fin
			addi $a0,$a0,1
			addi $a1,$a1,1
			j loop
		fin:
			lw $ra,0($sp)
			lw $a0,4($sp)
			addi $sp,$sp,8
			jr $ra
