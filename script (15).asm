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