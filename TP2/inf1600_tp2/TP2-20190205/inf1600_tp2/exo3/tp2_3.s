.data

	i:					# init index boucle for
	.int 0x0

	limiteFor:			# init constante limite de la boucle for
	.int 0xA

	E_CSTE:				# e reste constante tout au long de la séquence donc on la placera dans l'étiquette E_CSTE pour libérer un registre.
	.int 0x0

.global func_s

func_s:

	mov a, %eax			# La variable a est chargée dans le registre %eax 
	mov b, %ebx			# La variable b est chargée dans le registre %ebx
	mov c, %ecx			# La variable c est chargée dans le registre %ecx
	mov d, %edx			# La variable d est chargée dans le registre %edx
	mov i, %esi			# La variable d'indexation de la boucle for est chargée dans le registre %esi

	mov e, %edi
	mov %edi, E_CSTE	# On place e dans l'étiquette E_CSTE. On pourra utiliser le registre %edi à notre guise.

# Boucle for
for:
	cmp limiteFor, %esi		
	ja finSequence		# Si i­ > limiteFor, goto finSequence

# Opération a = d + e - b
	mov %edx, %eax		# a = d	
	add E_CSTE, %eax	# a = d + e
	sub %ebx, %eax		# a = d + e - b
	mov %eax, a			# La variable a est mise à jour. %eax peut être utilisé autrement jusqu'au prochain cycle for.

# 1er Bloc if
	mov %ebx, %eax		# On ne veut pas affecter le registre %ebx donc on utilise %eax
	sub $1000, %eax		# %eax = b - 1000
	mov %ecx, %edi		# On ne veut pas affecter le registre %ecx donc on utilise %edi
	add $500, %edi		# %edi = c + 500 
	cmp %eax, %edi		# flags = (c + 500) - (b - 1000) 
	jng else			# si flags <= 0, soit (b - 1000) >= (c + 500) alors on saute le bloc if et on va directement au else
						# si flags ­> 0, la condition du if est respectée (b - 1000) < (c + 500) et on poursuit avec...

	sub $500, %ecx		# c = c - 500

# 2e bloc if
	cmp %ecx, %ebx		# flags = b - c
	jng increment		# si flags <= 0, soit b <= c alors on saute le 2e bloc if et on va directement à l'incrémentation de i.
						# si flags > 0, la condition du 2e if est respectée b > c et on poursuit avec...

	sub $500, %ebx		# b = b - 500
	jmp increment		# on va directement à l'incrément de la boucle for		

# Bloc else	
else:
	sub E_CSTE, %ebx	# b = b - e
	add $500, %edx		# d = d + 500

# incrémentation de i et retour à la boucle for
increment:
	add $1, %esi		# i++
	jmp for

finSequence:
	ret 
