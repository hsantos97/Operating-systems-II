.global _start
_start:
    li t0, 0            # total soma
    la t3, vetor        # base do vetor
    la t4, fimvet
loop:
    lb t2, (t3)
    add t0, t0, t2     # t0 = 01 + t2
    addi t3, t3, 1
    blt t3, t4, loop
addi sp, sp, -8 # Aumenta a pilha em 8 bytes
sb t0, (sp)     # Move parte do conteúdo de t0 para o topo da pilha
#Parâmetros para write
li a0, 1        # stdout
mv a1, sp       # a1 <= sp
li a2, 1        # tamanho do buffer (1 byte)
li a7,  64      # número da syscall write
ecall
exit:
    li a0, 0
    li a7, 93
    ecall
vetor: .byte 60, 1, 2, 3
fimvet:         # endereço do final do vetor (vetor + 1)

#Qual a saída do programa soma-vetori.s? Como você a interpreta?
#saida é B, o resultado da soma do vetor que esta armazenada no registrador t0 é um valor decimal
#que pela tabela asci 66 é B.

#Qual a consequência de copiarmos para a memória apenas 1 byte do registrador t0(linha 12) em vez de copiar
#todo o conteúdo do registrador ?
#Caso o valor da soma ultrapssar o valor de 1 byte, o programa imprime apenas 1 byte(sb), no caso de uso do
#lw temos 4bytes. Nesse caso ele continuara imprimindo B.
