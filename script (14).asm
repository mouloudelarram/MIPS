.data

.text
	fib:
		addi $sp,$sp,8
		sw $ra,4($sp)
		sw $a0,0($sp)
		beq $a0,$0,return
		addi $t0,$0,1
		beq $a0,$t0,return
		addi $a0,$a0,-1
		jal fib
		
		lw  $a0,0($sp)
		sw $v0,0($sp)
		addi $a0,$a0,-2
		jal fib
		lw $t1,0($sp)
		add $v0,$t1,$v0
		lw $ra,4($sp)
		addi $sp,$sp,8
		jr $ra
	return:
		add $v0,$a0,$0
		lw $ra,4($sp)
		lw $a0,0($sp)
		addi $sp,$sp,8
		jr $ra