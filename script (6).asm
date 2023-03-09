.data
prompt: .asciiz "\nEntrez un caract�re : "
resultat: .asciiz "\nLe r�sultat en binaire est : "

.text
main:
    # Affiche le prompt pour entrer un caract�re
    li $v0, 4
    la $a0, prompt
    syscall

    # Lit l'entr�e de l'utilisateur
    li $v0, 12
    syscall

    # Convertit le caract�re en entier
    move $t0, $v0
    
    # Convertit l'entier en binaire
    li $t1, 8
    li $s0, 0
    loop:
        addi $t1, $t1, -1
        sll $t0, $t0, 1
        add $s0, $s0, $t0
        bgtz $t1, loop
        
    # Affiche le r�sultat en binaire
    li $v0, 4
    la $a0, resultat
    syscall
    li $v0, 16
    move $a0, $s0
    syscall

    # Quitte le programme
    li $v0, 10
    syscall
