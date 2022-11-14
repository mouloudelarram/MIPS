.data
	message: .asciiz "enter le nombre n pour calculer son fact :"


.text
	main:
		la $a0,message
		li $v0,4
		syscall
		li $v0,5
		syscall
		addi $a0,$v0,0
		#li $a0,6
		addi $t1,$a0,0
		jal fact
		li $v0,1
		syscall
		#exit
		li $v0,10
		syscall
	fact:
		
		add $sp,$sp,-4
		sw $ra, 0($sp)
		li $t0,1
		addi $a0,$a0,-1
		blt $a0,$t0,fin
		
		
		mult $t1,$a0
		mflo $t1
		j fact
		
		fin: 
			move $a0,$t1
			lw $ra, 0($sp)
			addi $sp,$sp,4
			jr $ra