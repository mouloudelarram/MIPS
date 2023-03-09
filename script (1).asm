    .data
    hex_string: .space 8  # espace pour stocker la chaîne hexadécimale
    bin_string: .space 34 # espace pour stocker les chaînes binaires
    format_string: .asciiz "signe = %d\nmantisse = %s\nexposant = %s\n"

    .text
    main:
        # demander à l'utilisateur d'entrer une chaîne hexadécimale
        li $v0, 8
        la $a0, hex_string
        li $a1, 8
        syscall

        # convertir la chaîne hexadécimale en entier
        li $t0, 0
        la $a0, hex_string
        li $a1, 8
        jal strtol

        # extraire les composantes mantisse, exposant et signe
        srl $t1, $t0, 23 # exposant (8 bits les plus à droite)
        andi $t1, $t1, 0xff
        addi $t1, $t1, -127 # correction de l'exposant

        srl $t2, $t0, 31 # signe (bit le plus à gauche)
        andi $t2, $t2, 1

        andi $t3, $t0, 0x7fffff # mantisse (23 bits du milieu)

        # convertir les composantes en chaînes binaires
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

# strtol : convertir une chaîne hexadécimale en entier
# entrée : pointeur de la chaîne hexadécimale (a0), longueur de la chaîne (a1)
# sortie : entier converti (v0)
strtol:
    li $v0, 0    # initialiser l'entier résultant à 0
    li $t0, 0    # initialiser un compteur à 0

strtol_loop:
    beq $t0, $a1, strtol_done  # sortir de la boucle si le compteur atteint la longueur de la chaîne
    lb $t1, 0($a0)    # lire le prochain caractère de la chaîne
    addi $t0, $t0, 1  # incrémenter le compteur
    addi $a0, $a0, 1  # avancer le pointeur de la chaîne
    blt $t1, 48, strtol_loop  # ignorer les caractères non-numériques
    bgt $t1, 57, strtol_loop
    sub $t1, $t1, 48 # convertir le caractère en entier
    sll $v0, $v0, 4  # décaler le résultat pour faire de la place pour les nouveaux bits
    or $v0, $v0, $t1 # ajouter les nouveaux bits au résultat
    j strtol_loop   # continuer à lire les caractères suivants

strtol_done:
    jr $ra     # retourner le résultat

# itoa : convertir un entier en chaîne binaire
# entrée : base de la conversion (a0), entier à convertir (a1), nombre de bits à convertir (a2)
# sortie : pointeur de la chaîne résultante (v0)
itoa:
    addi $sp, $sp, -4    # allouer de l'espace sur la pile pour stocker la chaîne résultante
    sw $ra, 0($sp)   # sauvegarder la valeur de ra pour la récupérer plus tard

    li $v0, bin_string    # initialiser le pointeur de la chaîne résultante
    li $t0, 0    # initialiser un compteur à 0

itoa_loop:
    beq $t0, $a2, itoa_done    # sortir de la boucle si le compteur atteint le nombre de bits à convertir
    sll $a1, $a1, 1    # décaler le bit le plus à gauche de l'entier vers la droite
    addi $t0, $t0, 1   # incrémenter le compteur
    lb $t1, 0($v0) # lire le
