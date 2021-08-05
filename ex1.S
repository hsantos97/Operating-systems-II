.globl _start

_start:
    li a0, 1 # file descriptor = 1 (stdout)
    la a1, msg #  buffer
    li a2, 4 # size
    li a7, 64 # syscall write (64)
    ecall

    li a0, 0 # exit code
    li a7, 93 # syscall exit
    ecall

msg:  .4byte 0x43414a55

#para a2, 1 a saida é U
#para a2, 4 a saida é UJAC