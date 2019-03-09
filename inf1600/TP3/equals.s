.globl matrix_equals_asm

matrix_equals_asm:
    push %ebp			/* Save old base pointer */
    mov %esp, %ebp		/* Set ebp to current esp */

	sub $8, %esp   				#espace alloué dans la pile pour r et c, deux entiers de 4 octets

	movl $0, -4(%ebp)			#r=0 afin d'initialiser la boucle forR
	#c est dans -8(%ebp)
	mov 8(%ebp), %esi			#esi = inmatdata1, 4 octets
	mov 12(%ebp), %edi			#edi = inmatdata2, 4 octets
	mov 16(%ebp), %ebx			#ebx = matorder, 4 octets

forR:							#label de la boucle for avec r < matorder
	movl $0, -8(%ebp)	    	#On initialise c à 0 avant le début de la boucle forC

forC:							#label de la boucle for avec c < matorder
	mov -4(%ebp), %eax	   		#eax = r
	imul %ebx, %eax		    	#eax = r * matorder
	addl -8(%ebp), %eax     	#eax = c + r* matorder
	lea (, %eax,4), %edx    	#edx = eax*4
	lea (%edx, %esi), %esi  	#esi = inmatdata1+4*(c+r*matorder), revient à inmatdata1[c+r*matorder]
	lea (%edx, %edi), %edi  	#edi = inmatdata2 + 4*(c+r*matorder), revient à inmatdata2[c+r*matorder]

	cmp %esi, %edi		    	#on compare les deux pointeurs
	jne retZero			    	#S'ils ne sont pas égaux, on retourne 0 (voir retZero)
		
continueForC:					#label pour la continuité de la boucle for avec c (la condition d'arrêt n'a pas été remplie)       
	cmp -8(%ebp), %ebx			#Comparaison entre la valeur de c et celle de matorder
	incl -8(%ebp)				#On incrémente la valeur de c (++c)
	ja forC						#Si matorder est plus grand que c, on refait la boucle (retour vers forC)
	
continueForR:					#label pour la continuité de la boucle for avec r (la condition d'arrêt n'a pas été remplie)
		
	cmp -4(%ebp), %ebx			#Comparaison entre r et matorder
	incl -4(%ebp)				#On incrémente la valeur de r (++r)
	ja forR						#Si matorder est plus grand que r, on refait la boucle. Sinon, aucun branchement n'est à faire et on sort.

retUn:							#Label pour retourner 1 en cas d'égalité des deux matrices
	mov $1, %eax				#On donne la valeur 1 au registre eax
	jmp epilogue				#Branchement vers l'épilogue
	
retZero:						#Label pour retourner 0 en cas d'inégalité des matrices
	mov $0, %eax				#Donne la valeur 0 au registre eax
	jmp epilogue				#Branchement vers l'épilogue

epilogue:						#Label pour la fin du programme
    leave          				/* Restore ebp and esp */
    ret            				/* Return to the caller */
