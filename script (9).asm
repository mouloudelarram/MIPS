.data
prompt: .asciiz "Entrez un nombre flottant double précision (0 pour terminer) : "
result: .asciiz "La moyenne des nombres est : "
zero: .double 0.00
un: .double 1.00

.text
main:

    ldc1 $f8,zero
    ldc1 $f10,un	
    
   
    # Initialisation des variables
    ldc1 $f6, zero   # compteur pour le nombre de nombres entrés
    add.d $f2,$f2,$f8 # somme des nombres entrés
    

    # Boucle de lecture des nombres
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 7
    syscall
    mov.d $f4, $f0
    while:
        c.eq.d $f4,$f8
        bc1t end_while
        add.d $f6, $f6, $f10
        add.d $f2, $f2, $f4
        li $v0, 4
        la $a0, prompt
        syscall
        li $v0, 7
        syscall
        mov.d $f4, $f0
        j while
        nop
    end_while:
    # calcul de la moyenne
    
    
    
    div.d $f12, $f2, $f6
    # Affichage de la moyenne
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 3
    syscall
    # Fin du programme
    li $v0, 10
    syscall
