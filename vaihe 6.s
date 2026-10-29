.data
a:     .word 0                # first number
b:     .word 0                # second number
resv:  .word 0                # result

num1: .string "Please, insert the first number: "
num2: .string "Please, insert the second number: "
res:  .string "The result is: "
error: .string "Error"

.text
main:
    #asking for the first number
    la   a0, num1
    li   a7, 4                  # print string
    ecall
    li   a7, 5                  # read int
    ecall
    addi t1, x0, -1000         # t1 = -1000
    bge  t1, a0, error_msg     # if a <= -1000 to error msg
    addi t2, x0, 1000          # t2 = 1000
    bge  a0, t2, error_msg     # if a >= 1000 to error msg

    la   t0, a
    sw   a0, 0(t0)             # save to a

    #asking for the second number
    la   a0, num2
    li   a7, 4                  # print string
    ecall
    li   a7, 5                  # read int
    ecall
    addi t1, x0, -1000         # t1 = -1000
    bge  t1, a0, error_msg     #if b <= -1000 to  error msg
    addi t2, x0, 1000          # t2 = 1000
    bge  a0, t2, error_msg     #if b >= 1000 to error msg

    la   t0, b
    sw   a0, 0(t0)             # save to b

    # load numbers from memory
    la   t0, a
    lw   x11, 0(t0)            # x11 = a
    la   t0, b
    lw   x12, 0(t0)            # x12 = b

    # multiplication
    add  a0, x12, x0           # a0 = b
    add  a1, x11, x0           # a1 = a
    jal  ra, function
    add  x10, a2, x0           # x10 = result

    la   t0, resv
    sw   x10, 0(t0)            # save result

    # print the result
    la   a0, res
    li   a7, 4                  # print string
    ecall
    la   t0, resv
    lw   a0, 0(t0)              # a0 = result
    li   a7, 1                  # print int
    ecall

    addi a7, x0, 10            # exit
    ecall


error_msg:
   la   a0, error
   li   a7, 4                  # print error string
   ecall
   addi a7, x0, 10             # exit
   ecall

function:
    add  a2, x0, x0            # c = 0
    bge  x0, a0, neg_loop      # if b <= 0 to neg_loop

pos_loop:
    bge  x0, a0, end           # if b <= 0 to end
    add  a2, a2, a1            # c += a
    addi a0, a0, -1            # b -= 1
    j pos_loop

neg_loop:
    bge  a0, x0, end           # if b >= 0 to end
    sub  a2, a2, a1            # c -= a
    addi a0, a0, 1             # b += 1
    j neg_loop

end:
    jr   ra                    # return
