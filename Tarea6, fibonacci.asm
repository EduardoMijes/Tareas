.data

.text

	li $s0, 6	# n
	li $t0, 0	# fn-2
	li $t1, 1	# fn-1
	li $v0, 1	# Se inicializa en 1 por ser la suma de 1 y 0, de aquí en adelante comienza la serie
	jal fibonacci	
	j Exit	
 	
fibonacci:
	bgt $s0, 2,  if		# Salta si n < 2
	
	jr $ra
if: 		
	addi $sp, $sp, -20	# Pide memoria para 20 bytes de memoria
	sw $t2, 16($sp)		# Guardamos fn
	sw $s0, 12($sp)		# Guarda n
	sw $t0, 8($sp) 		# Guarda fn-2
	sw $t1, 4($sp) 		# Guarda fn-1
	sw $ra, 0($sp)		# Guarda registro
	
	addi $s0, $s0, -1	# Se reduce n--
	# Actualización de registros
	add $t2, $t0, $t1	# Suma fn = fn-1 + fn-2		
	addi $t0, $t1, 0	# Ahora en fn-2 va a estar fn-1
	addi $t1, $t2, 0 	# Ahora en fn-1 va a estar fn

	jal fibonacci		
	
	lw $ra, 0($sp)		# Recupera el valor de ra
	lw $t1, 4($sp)		# Se recupera cada fn-1
	lw $t0, 8($sp)		#  Se recupera cada fn-2
	lw $s0, 12($sp)		# Recuperamos el valor de n
	lw $t2, 16($sp)		# Recuperamos el valor de fn
	addi $sp, $sp, 20	# se libera la memoria

	add $v0, $v0, $t1	# En v0 vamos almacenando la suma de todos los fn-1 para al final tener fn
		
	jr $ra			 # Return 
		
Exit: