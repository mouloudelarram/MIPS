    .data
    hex_string: .space 8  # espace pour stocker la cha�ne hexad�cimale
    bin_string: .space 34 # espace pour stocker les cha�nes binaires
    format_string: .asciiz "signe = %d\nmantisse = %s\nexposant = %s\n"

    .text
    main:
        # demander � l'utilisateur d'entrer une cha�ne hexad�cimale
        li $v0, 8
        la $a0, hex_string
        li $a1, 8
        syscall

        # convertir la cha�ne hexad�cimale en entier
        li $t0, 0
        la $a0, hex_string
        li $a1, 8
        jal strtol

        # extraire les composantes mantisse, exposant et signe
        srl $t1, $t0, 23 # exposant (8 bits les plus � droite)
        andi $t1, $t1, 0xff
        addi $t1, $t1, -127 # correction de l'exposant

        srl $t2, $t0, 31 # signe (bit le plus � gauche)
        andi $t2, $t2, 1

        andi $t3, $t0, 0x7fffff # mantisse (23 bits du milieu)

        # convertir les composantes en cha�nes binaires
        li $a0, 2
        li $a1, $t2
        li $a2, 1
        jal itoa
        la $a0, bin_string
        move $a1, $v0
        jal strcat

        li $a0, 2
        li $a1, $t1
        li $a2, 8
        jal itoa
        la $a0, bin_string
        move $a1, $v0
        jal strcat

        la $a0, bin_string
        jal strcat

        li $a0, 2
        li $a1, $t3
        li $a2, 23
        jal itoa
        la $a0, bin_string
        move $a1, $v0
        jal strcat

        # afficher les composantes en binaire
        li $v0, 4
        la $a0, format_string
        li $a1, $t2
        la $a2, bin_string
        syscall

# strtol : convertir une cha�ne hexad�cimale en entier
# entr�e : pointeur de la cha�ne hexad�cimale (a0), longueur de la cha�ne (a1)
# sortie : entier converti (v0)
strtol:
    li $v0, 0    # initialiser l'entier r�sultant � 0
    li $t0, 0    # initialiser un compteur � 0

strtol_loop:
    beq $t0, $a1, strtol_done  # sortir de la boucle si le compteur atteint la longueur de la cha�ne
    lb $t1, 0($a0)    # lire le prochain caract�re de la cha�ne
    addi $t0, $t0, 1  # incr�menter le compteur
    addi $a0, $a0, 1  # avancer le pointeur de la cha�ne
    blt $t1, 48, strtol_loop  # ignorer les caract�res non-num�riques
    bgt $t1, 57, strtol_loop
    sub $t1, $t1, 48 # convertir le caract�re en entier
    sll $v0, $v0, 4  # d�caler le r�sultat pour faire de la place pour les nouveaux bits
    or $v0, $v0, $t1 # ajouter les nouveaux bits au r�sultat
    j strtol_loop   # continuer � lire les caract�res suivants

strtol_done:
    jr $ra     # retourner le r�sultat

# itoa : convertir un entier en cha�ne binaire
# entr�e : base de la conversion (a0), entier � convertir (a1), nombre de bits � convertir (a2)
# sortie : pointeur de la cha�ne r�sultante (v0)
itoa:
    addi $sp, $sp, -4    # allouer de l'espace sur la pile pour stocker la cha�ne r�sultante
    sw $ra, 0($sp)   # sauvegarder la valeur de ra pour la r�cup�rer plus tard

    li $v0, bin_string    # initialiser le pointeur de la cha�ne r�sultante
    li $t0, 0    # initialiser un compteur � 0

itoa_loop:
    beq $t0, $a2, itoa_done    # sortir de la boucle si le compteur atteint le nombre de bits � convertir
    sll $a1, $a1, 1    # d�caler le bit le plus � gauche de l'entier vers la droite
    addi $t0, $t0, 1   # incr�menter le compteur
    lb $t1, 0($v0) # lire le
