//Ex 1 a

.data 
	message: .asciiz "entre un entier: "
.text
	la $a0,message
	li $v0,4
	syscall
	li $v0,5
	syscall
	add $s0,$s0,$v0
	
	la $a0,message
	li $v0,4
	syscall
	li $v0,5
	syscall
	add $s0,$s0,$v0
	
	la $a0,message
	li $v0,4
	syscall
	li $v0,5
	syscall
	add $s0,$s0,$v0
	
	move $a0, $s0
	li $v0,1
	syscall

//Ex 1_b


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
		
	
// Ex 2 Td 3 1
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



//Ex2 td 3 2
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
			
//Ex 2 TD 3 3
	
					
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
			
			
// EX 2, TD 3 4 a

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
		
		
//Ex 2 td 3 4_b

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
		
//ex 2 td 4 1

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
	

//Ex 2 td 4 2 a
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
		
		
		
//Ex 2, td 4 2_b

main:
        li      $a0, 5
        jal     fib
        move    $a0, $v0
        li      $v0, 1          # Afficher
        syscall
        li      $v0, 10         # Quitter
        syscall

fib:
        li      $s0, 0          # a = 0
        li      $s1, 1          # b = 1

for:
        beqz    $a0, return
        subi    $a0, $a0, 1

        move    $t0, $s0        # t = a
        move    $s0, $s1        # a = b
        add     $s1, $t0, $s1   # b = t + b

        j       for

return:
        move    $v0, $s0
        jr      $ra