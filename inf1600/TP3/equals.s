.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp			/* Save old base pointer */
        mov %esp, %ebp		/* Set ebp to current esp */

        sub $8, %esp			# Alloue espace dans la pile pour r et c, les indices row/column.
		mov $0, -4(%ebp)		# r = 0 	
        mov $0, -8($ebp)		# c = 0

								# Les paramètres sont stockés dans les registres
		mov 8(%ebp), %eax 		# %eax <- inmatdata1
		mov 12(%ebp), %ecx		# %ecx <- inmatdata2
		mov 16(%ebp), %edx		# %edx <- matorder

forR:

forC:	
		# Instruction if(inmatdata1[c + r * matorder] != inmatdata2[c + r * matorder])

continueForC:
		inc -8(%ebp)			# c++
		cmp -8(%ebp), %edx		# flags = matorder - c
		ja forC					# Si c ­< matorder on exécute la boucle forC 
		mov $0, -8(%ebp)		# Sinon, on réinitialise l'indice c = 0

continueForR:
		inc -4(%ebp)			# r++
		cmp -4(%ebp), %edx		# flags = matorder - r
		ja forR					# Si r ­< matorder on exécute la boucle forR
		mov $0, -4(%ebp)		# Sinon, on réinitialise l'indice r = 0		


        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */
