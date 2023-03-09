.data
	
.text	
	add $s3,$0,$0
	for1:
		slt $t0,$s3,$s2
		beq $t0,$s0,out_1
		addi $s4,$s3,-1
	for2:
		slt $t0,$s4,$0
		bne $t0,$s0,out_2
		sll $t1,$s4,2
		add $t2,$s6,$t1
		lw $t3,0($t2)
		lw $t4,4($t2)
		slt $t0,$t4,$s3
		beq $t0,$0,out_2
		add $s5,$t3,$0
		add $t3,$t4,$0
		add $t4,$s5,$0
		sw $t3,0($t2)
		sw $t4,4($t2)
		addi $s4,$s4,-1
		j for2
	out_2:
		addi $s3,$s3,1
		j for1
	out_1:
		li $v0,10
		syscall