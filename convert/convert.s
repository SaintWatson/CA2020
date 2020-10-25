.global convert
.type matrix_mul, %function

.align 2
# int convert(char *);
convert:

    # insert your code here
    # Green card here: https://www.cl.cam.ac.uk/teaching/1617/ECAD+Arch/files/docs/RISCVGreenCardv8-20151013.pdf

    addi s1, x0, 1  # s1 for the sign 1 is positive, -1 is negative
    lb a1, 0(a0)    # a1 is the first char
    add t1, a0, x0  # t1 points to first char
    addi s2, x0, 0  # s2 is the accumulator
   
    # if a1 = '-'
    addi t2, x0, 45 #t2 = 45
    beq a1, t2, NEG
    
    # if a1 = '+'
    addi t2, x0, 43 #t2 = 43
    beq a1, t2, POS

    # else
    beq x0, x0, LOOP

NEG:
    addi s1, x0, -1 # set s1 to -1
    addi t1, t1, 1  # point to first digit
    beq x0, x0, LOOP

POS:
    addi t1, t1, 1
    beq x0, x0, LOOP

LOOP:
    lb t2, 0(t1)        # t2 is the value that t1 pointing to.
    beq t2, x0, EXIT    # out condition

    addi t2, t2, -48    # turn ascii to int
    blt t2, x0, ERR     # t2<0
    addi t0, x0, 9      # t0 for temp constant
    blt t0, t2, ERR     # t2>9

    addi t0, x0, 10     # t0=10
    mulw s2, t0, s2     # s2 *= 10  64-bits to keep from overflow
    addw s2, s2, t2     # s2 += t2  64-bits to keep from overflow
    addi t1, t1, 1      # move t1
    beq x0, x0, LOOP

EXIT:
    mulw s2, s1, s2     # s2 *= s1 // the sign
    add a0, s2, x0
    ret

ERR:
    addi a0, x0, -1
    ret


