.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp			/* Save old base pointer */
        mov %esp, %ebp		/* Set ebp to current esp */

		sub $12, %esp   #espace alloué pour r et c

		movl $0, -8(%ebp)		#r=0
		movl $0, -12(%ebp)		#c=0

		mov 8(%ebp), %esi		#esi <- inmatdata1
		mov 12(%ebp), %edi		#edi <- inmatdata2
		mov 16(%ebp), %ebx		#ebx <- matorder

forR:							#label de la boucle for avec r < matorder
forC:							#label de la boucle for avec c < matorder
		mov -8(%ebp), %eax		#eax <- r
		mul %edx				#eax = r * matorder
		addl -12(%ebp), %eax    #eax = c + r* matorder
		mov %eax, (%esi)		#inmatdata[1c + r * matorder]
		mov %eax, (%edi)		#inmatdata2[c + r * matorder]
		cmp %esi, %edi			#on compare les valeurs des deux dernières lignes
		jne retZero				#Si elles ne sont pas égales, on retourne 0 (voir retZero)

continueForC:					#label pour la continuité de la boucle for avec c (la condition d'arrêt n'a pas été remplie)
		incl -12(%ebp) 			#On incrémente la valeur de c (++c)
		cmp -12(%ebp), %ebx		#Comparaison entre c et matorder
		ja forC					#Si matorder est plus grand que c, on refait la boucle
		movl $0, -12(%ebp)		#Sinon, c est réinitialisé à 0 avant la boucle for de r (avec r < matorder)

continueForR:					#label pour la continuité de la boucle for avec r (la condition d'arrêt n'a pas été remplie)
		incl -8(%ebp)			#On incrémente la valeur de r (++r)
		cmp -8(%ebp), %ebx		#Comparaison entre r et matorder
		ja forR					#Si matorder est plus grand que r, on refait la boucle. Sinon, aucun branchement n'est à faire et on sort.

retUn:							#Label pour retourner 1 en cas d'égalité des deux matrices
		mov $1, %eax			#On donne la valeur 1 au registre eax
		jmp epilogue			#Branchement vers l'épilogue
	
retZero:						#Label pour retourner 0 en cas d'inégalité des matrices
		mov $0, %eax			#Donne la valeur 0 au registre eax
		jmp epilogue			#Branchement vers l'épilogue

epilogue:
		mov -4(%ebp), %ebx		# Ré-établie ebx
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */
