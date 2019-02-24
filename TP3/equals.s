.globl matrix_equals_asm

matrix_equals_asm:
								# Prologue
        push %ebp				# Sauvegarde l'ancien base pointer sur la pile
        mov %esp, %ebp			# Sauvegarde le %esp courant dans %ebp
		push %ebx				# Sauvegarde le contenu du registre %ebx sur la pile

        sub $12, %esp			# Alloue espace dans la pile pour r et c, les indices row/column.
		mov $0, -8(%ebp)		# r = 0 	
        mov $0, -12(%ebp)		# c = 0

								# Les paramètres sont stockés dans les registres
		mov 8(%ebp), %ebx 		# %ebx <- inmatdata1
		mov 12(%ebp), %ecx		# %ecx <- inmatdata2
		mov 16(%ebp), %edx		# %edx <- matorder
		
forR:
forC:	
								# Instruction if(inmatdata1[c+r*matorder]!=inmatdata2[c+r*matorder])
		mov -8(%ebp), %eax		# %eax = r
		mul %edx				# %eax = r * matorder
		add -12(%ebp), %eax		# %eax = c + r * matorder
		cmp (%eax, %ebx), (%eax, %ecx) 
								# inmatdata2[c+r*matorder] - inmatdata1[c+r*matorder]
		jne	returnZero			# Saute à returnZero si des éléments des matrices ne sont pas identiques

continueForC:
		inc -12(%ebp)			# c++
		cmp -12(%ebp), %edx		# flags = matorder - c
		ja forC					# Si c ­< matorder on exécute la boucle forC 
		mov $0, -12(%ebp)		# Sinon, on réinitialise l'indice c = 0

continueForR:
		inc -8(%ebp)			# r++
		cmp -8(%ebp), %edx		# flags = matorder - r
		ja forR					# Si r ­< matorder on exécute la boucle forR
		mov $0, -8(%ebp)		# Sinon, on réinitialise l'indice r = 0		

returnOne:
		mov $1, %eax			# %eax = 1, les matrices sont équivalentes
		jmp epilogue			# Saute à l'épilogue de la fonction

returnZero:
		mov $0, %eax			# %eax = 0, les matrices sont différentes
		
epilogue:						# Épilogue
		mov -4(%ebp), %ebx		# Ré-établie ebx
        leave					# Ré-établie ebp et esp d'origine
        ret						# Retour à l'appelant de la fonction
