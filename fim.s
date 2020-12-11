               .data

mensagem:     .asciiz "Digite um numero\n"
numero: 	         .word 1
proximo:           .word 1
pessoa:            .word 1
pessob:            .word 1
		
	.text

main:        
                 addi $s0,$t0,0 #w0*100
                 addi $s1,$t0,80 # w1*100
                
                 addi $s2,$t0,5 # taixa*100
                
                 addi $s3,$t0,5 # repet
                 #for
                 addi $t7,$t0,1#n
                 addi $t0,$t0,0
for:            slt $t1,$t0,$s3
                 beq $t1,$t9,fim
 
                 add $t4,$t7,$t7 #resp n+n

                 mul $s4,$t7,$s0  #n*w0
                 mul $s5,$t7,$s1  #n*w1
                 add $t2,$s4,$s5  #soma

                 sub $t5,$t4,$t2 #erro   
                      
                 #peso1
                 mul $t3,$t5,$s2
                 mul $t6,$t3,$t7
                 add $s0,$s0,$t6
                

                 #peso2
                mul $v1,$t5,$s2
                mul $t8,$v1,$t7
                add $s1,$s1,$t8
                
               

               addi $t0,$t0,1
               addi $t7,$t0,1
               j for

fim:        

               sw $s0,pessoa
               sw $s1,pessob
               # imprime mensagem
	li $v0, 4 
	la $a0, mensagem
	syscall

	# lê inteiro
	li $v0, 5 
	syscall
			
	# grava numero na memória	
	sw $v0, numero
			
	# calcular

                mul $s6,$v0,$s0
                mul $s7,$v0,$s1
	add $t2,$s6,$s7

	# grava proximo
	sw $t2, proximo
			
	# imprime inteiro
	li $v0, 1
	move $a0, $t2
	syscall

	jr $ra