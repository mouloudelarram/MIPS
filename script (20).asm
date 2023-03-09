.data
	g: .asciiz "enter g ="
	h: .asciiz "enter h ="
	i: .asciiz "enter i ="
	j: .asciiz "enter j ="
	result: .asciiz " le resultat de la fonction est :"
.text
	main:
		#lire g
		la $a0,g
		li $v0,4
		syscall
		li $v0,5
		syscall
		move $t0, $v0
		#lire h
		la $a0,h
		li $v0,4
		syscall
		li $v0,5
		syscall
		move $t1, $v0
		#lire i
		la $a0,i
		li $v0,4
		syscall
		li $v0,5
		syscall
		move $t2, $v0
		#lire j
		la $a0,j
		li $v0,4
		syscall
		li $v0,5
		syscall
		move $t3, $v0
		#preparer les arguments pour la fonction
		move $a0,$t0
		move $a1,$t1
		move $a2,$t2
		move $a3,$t3
		#appel la fonction exemple_feuille(g,h,i,j);
		jal exemple_feuille
		la $a0,result
		li $v0,4
		syscall
		move $a0,$v1
		li $v0,1
		syscall
		
		#exit
		li $v0,10
		syscall
		
	exemple_feuille:
		addi $sp,$sp,-4
		sw $ra, 0($sp)
		
		add $t0,$a0,$a1
		add $t1,$a2,$a3
		sub $v1,$t0,$t1
		
		lw $ra, 0($sp)
		addi $sp,$sp,4
		
		jr $ra

