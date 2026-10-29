.data
  a: .word -3                    #a = -3
  b: .word 2                     #b = 2
  res: .word 0                   #result


  .text
  main:
     la t0, a
     lw x11, 0(t0)
     la t0, b
     lw x12, 0(t0)


     add  a0, x12, x0           #a0 = b
     add  a1, x11, x0           #a1 = a
     jal  ra, function
     add  x10, a2, x0           #x10 = c
     la t0, res
     sw x10, 0(t0)
     addi a7, x0, 10            #end
     ecall

 function:
     add  a2, x0, x0            #c = 0
     bge  x0, a0, neg_loop      #if b <= 0 to neg_loop

 pos_loop:
     bge  x0, a0, end           #if b <= 0 to end
     add  a2, a2, a1            #c = c + a
     addi a0, a0, -1            #b -= 1
     j pos_loop

 neg_loop:
     bge  a0, x0, end           #if b > 0 to end
     sub  a2, a2, a1            #c = c - a
     addi a0, a0, 1             #b += 1
     j neg_loop

 end:
     jr ra                      #return
