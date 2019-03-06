.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
        push %ebp			/* Save old base pointer */
        mov %esp, %ebp		/* Set ebp to current esp */

		sub $8, %esp   #espace alloué pour r et c

		movl $0, -4(%ebp)		#r=0
		movl $0, -8(%ebp)		#c=0

		#mov 8(%ebp), %esi		#esi <- inmatdata1
		#mov 12(%ebp), %edi		#edi <- inmatdata2
		mov 16(%ebp), %ebx		#ebx <- matorder

forR:						   #label de la boucle for avec r < matorder
        movl $0, -8(%ebp)		#Sinon, c est réinitialisé à 0 avant la boucle for de r (avec r < matorder)
forC:						   #label de la boucle for avec c < matorder

	    mov 8(%ebp), %esi		#esi <- inmatdata1
	    mov 12(%ebp), %edi		#edi <- inmatdata2

        mov -4(%ebp), %eax
        mov -8(%ebp), %edx
        cmp %eax, %edx          #comparer r et c
        jne else                #s'ils ne sont pas égaux, on va à la partie else

        mov -8(%ebp), %eax	   #eax = c
	    imul %edx, %eax		   #eax = c * matorder
	    addl -4(%ebp), %eax        #eax = r + c * matorder
	    lea (, %eax, 4), %ebx      #ebx = 4*(r + c * matorder)
	    mov %edi, %eax             #eax = inmatdata
	    lea (%ebx, %eax), %edi     #esi = inmatdata + 4*(r + c * matorder)

	    mov -4(%ebp), %eax	   #eax = r
	    imul %edx, %eax		   #eax = r * matorder
	    addl -8(%ebp), %eax        #eax = c + r * matorder
	    lea (, %eax, 4), %ebx      #edx = 4*(r + c * matorder)
	    mov %esi, %eax             #eax = outmatdata
	    lea (%ebx, %eax), %esi     #edi = outmatdata + 4*(c + r * matorder)
	    mov (%edi), %eax		#eax<-m[edi]
	    mov %eax, (%esi)	   #m[eax] <- m[edi]
	#ces deux dernières lignes font outmatdata[c + r * matorder] = inmatdata[r + c * matorder

else:
        mov -4(%ebp), %eax	   #eax = r
	    imul %edx, %eax		   #eax = r * matorder
	    addl -8(%ebp), %eax        #eax = c + r * matorder
	    lea (, %eax, 4), %ebx      #edx = 4*(r + c * matorder)
	    mov %esi, %eax             #eax = outmatdata
	    lea (%ebx, %eax), %esi     #edi = outmatdata + 4*(c + r * matorder)
	    movl $0, (%edi)		#eax<-m[edi]
	   
continueForC:					#label pour la continuité de la boucle for avec c (la condition d'arrêt n'a pas été remplie)
					#On incrémente la valeur de c (++c)
		
        cmp -8(%ebp), %ebx		#Comparaison entre c et matorder
        incl -8(%ebp) 
        ja forC					#Si matorder est plus grand que c, on refait la boucle
		

continueForR:					#label pour la continuité de la boucle for avec r (la condition d'arrêt n'a pas été remplie)
					#On incrémente la valeur de r (++r)
		cmp -4(%ebp), %ebx		#Comparaison entre r et matorder
        incl -4(%ebp)
		ja forR					#Si matorder est plus grand que r, on refait la boucle. Sinon, aucun branchement n'est à faire et on sort.


epilogue:
		mov (%ebp), %ebx		# Ré-établie ebx
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */

		
        leave          			/* Restore ebp and esp */
        ret            			/* Return to the caller */

