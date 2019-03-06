.globl matrix_transpose_asm

matrix_transpose_asm:
	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */
        
	sub $8, %esp  #espace alloué pour r et c
	movl $0, -4(%ebp)		#r=0
	movl $0, -8(%ebp)		#c=0

	mov 16(%ebp), %edx

forR:
	movl $0, -8(%ebp)
forC:
	mov 8(%ebp), %edi 	   #edi = inmatdata
	mov 12(%ebp), %esi 	   #esi = outmatdata
	

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

	
	mov (%edi), %eax	   #eax<-m[edi]
	mov %eax, (%esi)	   #m[eax] <- m[edi]
				   #ces deux dernières lignes font outmatdata[c + r * matorder] = inmatdata[r + c * matorder]


continueForC:			#label pour la continuité de la boucle for avec c (la condition d'arrêt n'a pas été remplie)
			#On incrémente la valeur de c (++c)
		#Comparaison entre c et matorder
	
	cmp -8(%ebp), %edx
	incl -8(%ebp) 
	ja forC			#Si matorder est plus grand que c, on refait la boucle
		#Sinon, c est réinitialisé à 0 avant la boucle for de r (avec r < matorder)

continueForR:			#label pour la continuité de la boucle for avec r (la condition d'arrêt n'a pas été remplie)
		
	cmp -4(%ebp), %edx	#On incrémente la valeur de r (++r)
	incl -4(%ebp)#Comparaison entre r et matorder
	ja forR			#Si matorder est plus grand que r, on refait la boucle. Sinon, aucun branchement n'est à faire et on sort.
        
epilogue:
	mov (%ebp), %ebx        # Rétablie ebx
	leave          /* Restore ebp and esp */
	ret            /* Return to the caller */



