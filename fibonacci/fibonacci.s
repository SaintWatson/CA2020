.global fibonacci
.type fibonacci, %function

.align 2
# unsigned long long int fibonacci(int n);
fibonacci:  
    
    # insert code here
    # Green card here: https://www.cl.cam.ac.uk/teaching/1617/ECAD+Arch/files/docs/RISCVGreenCardv8-20151013.pdf
    beq a0, x0, ZERO
    addi a1, x0, 0
    addi a2, x0, 1
    addi a3, x0, 1
    addi t1, x0, 2

LOOP: 
    blt a0, t1, EXIT
    add a3, a2, a1
    add a1, a2, x0
    add a2, a3, x0
    addi t1, t1, 1
    beq x0, x0, LOOP

EXIT: 
    add a0, x0, a2 
    ret

ZERO:
    ret    
