.data
prompt1: .asciiz "Entrez le premier nombre flottant : "
prompt2: .asciiz "Entrez le deuxième nombre flottant : "
prompt3: .asciiz "Entrez le troisième nombre flottant : "
result: .asciiz "\nLa somme des nombres est : "
result2: .asciiz "\nLe produit des nombres est : "

.text
main:
    # Affichage du prompt pour le premier nombre
    li $v0, 4
    la $a0, prompt1
    syscall

    # Lecture du premier nombre
    li $v0, 7
    syscall
    mov.d $f2, $f0

    # Affichage du prompt pour le deuxième nombre
    li $v0, 4
    la $a0, prompt2
    syscall

    # Lecture du deuxième nombre
    li $v0, 7
    syscall
    mov.d $f4, $f0

    # Affichage du prompt pour le troisième nombre
    li $v0, 4
    la $a0, prompt3
    syscall

    # Lecture du troisième nombre
    li $v0, 7
    syscall
    mov.d $f6, $f0

    # Calcul de la somme des trois nombres
    add.d $f8, $f2, $f4   
    add.d $f12, $f8, $f6
    
     # Affichage de la somme
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 3
    syscall

    # Calcul du produit des trois nombres
    mul.d $f8, $f2, $f4
    mul.d $f12, $f8, $f6

    # Affichage du produit
    li $v0, 4
    la $a0, result2
    syscall

    li $v0, 3
    syscall

    # Fin du programme
    li $v0, 10
    syscall
