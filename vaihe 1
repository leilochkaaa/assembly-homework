.text
main:
    addi x11, x0, 3       # a = 3
    addi x12, x0, 2       # b = 2
    addi x10, x0, 0       # c = 0

loop:
    bge  x0, x12, end     # if b <= 0 to end
    add  x10, x10, x11    # c += a
    addi x12, x12, -1     # b -= 1
    j    loop

end:
    addi a7, x0, 10       # exit
    ecall
