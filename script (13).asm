.data

.text
	set_array:
		addi $sp,$sp,-44
		sw $ra,40($sp)
		li $s0,0
	loop:
		slti $t1,$t0,10
		beq $t1,$0,fset
		sll $t0,$s0,2
		add $t6,$sp,$t0
		add $a1,$s0,$0
		jal compare
		sw $v0,0($t6)
		addi $s0,$s0,1
		j loop
	fset:
		lw $ra, 40($sp)
		add $sp,$sp,44
		jr $ra
	compare:
		addi $sp,$sp,-4
		sw $ra,0($sp)
		jal substraction
		slt $t2,$v0,$0
		addi $t3,$s0,1
		sub $v0,$t3,$t2
		lw $ra,0($sp)
		addi $sp,$sp,4
		jr $ra
	substraction:
		addi $sp,$sp,-4
		sw $ra,0($sp)
		sub $v0,$a0,$a1
		lw $ra,0($sp)
		addi $sp,$sp,4
		jr $ra
		
	li $v0,10
	syscall