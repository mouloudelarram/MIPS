.data
	strA: .asciiz "mouloud"
	strB: .asciiz"elarram"
.text
	main:
		la $a0,strA
		la $a1,strB
		jal  strcpy
			
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