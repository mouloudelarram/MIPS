.data
prompt: .asciiz "\nEnter la suite de huit chiffres hexadecimaux : "
output1: .asciiz "\nSign : "
output2: .asciiz "\nmantisse : "
output3: .asciiz "\nExponent : "
input: .space 8

.text
main:
    # Demande l'entrée
    li $v0, 4
    la $a0, prompt
    syscall
    # Lit l'entrée
    li $v0, 8
    la $a0, input
    li $a1, 8
    syscall
    move $a1,$a0
    
    # Affiche le sign
    li $v0, 4
    la $a0, output1
    syscall
    
    # Récupère le premier caractère
    move $a0, $0
    lb $t0, input
    blt $t0,56,skip
    
    addi $a0,$0, 1
    skip:
    
    li $v0, 1
    syscall

    # Affiche mantisse
    li $v0, 4
    la $a0, output2
    syscall
    
    li $v0,4 
    move $a0,$a1
    syscall

    # Affiche Exponent
    li $v0, 4
    la $a0, output3
    syscall
    
    li $v0,4 
    move $a0,$a1
    syscall
