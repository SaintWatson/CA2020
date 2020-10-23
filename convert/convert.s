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
    lb a0, 0(t1)
    # now t1 is point to first digit s1 for the sign
    ret

