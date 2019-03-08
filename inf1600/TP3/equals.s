.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp			/* Save old base pointer */
        mov %esp, %ebp		/* Set ebp to current esp */

		sub $8, %esp   #espace alloué pour r et c

		movl $0, -4(%ebp)		#r=0
		movl $0, -8(%ebp)		#c=0
		mov 8(%ebp), %esi		#esi <- inmatdata1
		mov 12(%ebp), %edi		#edi <- inmatdata2
		mov 16(%ebp), %ebx		#ebx <- matorder

forR:						   #label de la boucle for avec r < matorder
		movl $0, -8(%ebp)		#Sinon, c est réinitialisé à 0 avant la boucle for de r (avec r < matorder)
forC:						   #label de la boucle for avec c < matorder
		
		
		mov -4(%ebp), %eax	   #eax = r
		imul %ebx, %eax		   #eax = r * matorder
		addl -8(%ebp), %eax    #eax = c + r* matorder

		lea (, %eax,4), %edx   #edx = eax*4
		mov %esi, %eax		   #eax = inmatdata1
		lea (%edx, %eax), %esi #esi = inmatdata1[c + r* matorder], esi = inmatdata1 + 4*(c+r*matorder)
		
		mov %edi, %eax		   #eax = inmatdata2
		lea (%edx, %eax), %edi #edi = inmatdata2[c + r * matorder], edi = inmatdata2 + 4*(c+r*matorder)

		cmp %esi, %edi		   #on compare les valeurs de esi et edi
		jne retZero			   #Si elles ne sont pas égales, on retourne 0 (voir retZero)
		


continueForC:					#label pour la continuité de la boucle for avec c (la condition d'arrêt n'a pas été remplie)
		 			#On incrémente la valeur de c (++c)
		cmp -8(%ebp), %ebx		#Comparaison entre c et matorder
		incl -8(%ebp)
		ja forC					#Si matorder est plus grand que c, on refait la boucle
	

continueForR:					#label pour la continuité de la boucle for avec r (la condition d'arrêt n'a pas été remplie)
		
		cmp -4(%ebp), %ebx		#Comparaison entre r et matorder
		incl -4(%ebp)			#On incrémente la valeur de r (++r)
		ja forR					#Si matorder est plus grand que r, on refait la boucle. Sinon, aucun branchement n'est à faire et on sort.

retUn:							#Label pour retourner 1 en cas d'égalité des deux matrices
		mov $1, %eax			#On donne la valeur 1 au registre eax
		jmp epilogue			#Branchement vers l'épilogue
	
retZero:						#Label pour retourner 0 en cas d'inégalité des matrices
		mov $0, %eax			#Donne la valeur 0 au registre eax
		jmp epilogue			#Branchement vers l'épilogue

epilogue:
		mov (%ebp), %ebx		# Ré-établie ebx
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */
