.text
main:
    addi x11, x0, -3           # a = -3
    addi x12, x0, 2            # b = 2
    addi x10, x0, 0            # c = 0

    bge  x0, x12, neg_loop  # if b <= 0 to neg_loop

pos_loop:
    bge  x0, x12, end          # if b <= 0 to end
    add  x10, x10, x11         # c += a
    addi x12, x12, -1          # b -= 1
    j pos_loop

neg_loop:
    bge  x12, x0, end          # if b >= 0 to end
    sub  x10, x10, x11         # c -= a
    addi x12, x12, 1           # b += 1
    j neg_loop

end:
    addi a7, x0, 10            # exit
    ecall
