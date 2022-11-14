.data

.text
	swap:
		addi $sp,$sp,-4
		sw $ra,0($sp)
		sll $t3,$a1,2
		add $t1,$a0,$t3
		lw $s3,0($t1)
		lw $t2,4($t1)
		sw $t2,0($t1)
		sw $t3,4($t1)
		lw $ra,0($sp)
		addi $sp,$sp,4
		jr $ra
	sort:
		addi $sp,$sp,-8
		sw $ra,0($sp)
		sw $a1,4($sp)
		add $s0,$0,$0
	forOut:
		slt $t0,$s0,$a1
		beq $t0,$0,exitOut
		addi $s1,$s0,-1
		add $s2,$a1,$0
	forIn:
		slt $t0,$s1,$s2
		bne $t0,$0,exitIn
		sll $t2,$s1,2
		add $t1,$a0,$t2
		lw $t4,0($t1)
		lw $t3,4($t1)
		slt $t0,$t3,$t4
		beq $t0,$0,exitIn
		add $a0,$s1,$0
		jal swap
		addi $s1,$1,1
		j forIn
	exitIn:
		addi $s0,$s0,1
		j forOut
	exitOut:
		lw $ra,0($sp)
		addi $sp,$sp,8
		jr $ra		
		