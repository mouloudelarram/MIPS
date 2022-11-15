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


//Td3 4 a

.data
	tab: .space 5
	message_1: .asciiz "le tableux avant le tri est :  5 3 1 2 4 \n"
	message_2: .asciiz "le tableux apres le tri est : "
.text	
	la $a0,message_1
	li $v0,4
	syscall
		

	la $a0,tab
	
	# initialiser le tableux.
	li $s2,5
	
	li $t0,5
	sw $t0,0($a0)
	
	li $t0,3
	sw $t0,4($a0)
	
	li $t0,1
	sw $t0,8($a0)
	
	li $t0,2
	sw $t0,12($a0)
	
	li $t0,4
	sw $t0,16($a0)
	#initialisation terminer.
	
	move $s6,$a0
	
	
	add $s3,$0,$0
	for1:
		slt $t0,$s3,$s2
		beq $t0,$0,out_1
		addi $s4,$s3,-1
	for2:
		slt $t0,$s4,$0
		bne $t0,$0,out_2
		sll $t1,$s4,2
		add $t2,$s6,$t1
		lw $t3,0($t2)
		lw $t4,4($t2)
		slt $t0,$t4,$t3
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
	
		
		la $a0,message_2
		li $v0,4
		syscall
		
		#move $a0,$s6
		lw $a0,0($s6)
		li $v0,1
		syscall
		
		lw $a0,4($s6)
		li $v0,1
		syscall
		lw $a0,8($s6)
		li $v0,1
		syscall
		lw $a0,12($s6)
		li $v0,1
		syscall
		lw $a0,16($s6)
		li $v0,1
		syscall
		li $v0,10
		syscall
