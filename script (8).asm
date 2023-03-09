.data
	prompt1: .asciiz "Entrez le premier nombre flottant simple precision : "
	prompt2: .asciiz "Entrez le deuxième nombre flottant double precision : "
	prompt3: .asciiz "Le plus petit est : "
.text
	#demande le float
	li $v0, 4
	la $a0,prompt1
	syscall
	#lire le float
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	#demande le double
	li $v0, 4
	la $a0,prompt2
	syscall
	#lire le double
	li $v0, 7
	syscall
	mov.d $f4, $f0
	
	#affiche le plus petit
	li $v0, 4
	la $a0,prompt3
	syscall
	
	#convert double to simple
	cvt.s.d $f1,$f4	
	c.lt.s $f1, $f2    # Compare $f4 < $f2
	bc1t  skip          # Si vrai, saute à l'étiquette "skip"
	#si faux fait : 	
	mov.s $f12,$f2
	li $v0,2
	syscall
	j end
	
	skip: 
	mov.d $f12,$f4
	li $v0,3
	syscall
	
	end:
	li $v0, 10
	syscall
	
	
	
	
	
