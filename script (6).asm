.data
prompt: .asciiz "\nEntrez un caractère : "
resultat: .asciiz "\nLe résultat en binaire est : "

.text
main:
    # Affiche le prompt pour entrer un caractère
    li $v0, 4
    la $a0, prompt
    syscall

    # Lit l'entrée de l'utilisateur
    li $v0, 12
    syscall

    # Convertit le caractère en entier
    move $t0, $v0
    
    # Convertit l'entier en binaire
    li $t1, 8
    li $s0, 0
    loop:
        addi $t1, $t1, -1
        sll $t0, $t0, 1
        add $s0, $s0, $t0
        bgtz $t1, loop
        
    # Affiche le résultat en binaire
    li $v0, 4
    la $a0, resultat
    syscall
    li $v0, 16
    move $a0, $s0
    syscall

    # Quitte le programme
    li $v0, 10
    syscall
