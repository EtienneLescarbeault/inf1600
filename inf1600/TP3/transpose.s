.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        sub $8, %esp   #espace alloué pour r et c

	movl $0, -4(%ebp)		#r=0
	movl $0, -8(%ebp)		#c=0

	mov 8(%ebp), %esi		#esi <- inmatdata
	mov 12(%ebp), %edi		#edi <- outmatdata
	mov 16(%ebp), %ebx		#ebx <- matorder

forR:
forC:
        mov -8(%ebp), %eax	   #eax = c
	imul %ebx, %eax		   #eax = c * matorder
	addl -4(%ebp), %eax        #eax = r + c * matorder
        lea (, %eax, 4), %edx      #edx = 4*(r + c * matorder)
        mov %esi, %eax             #eax = inmatdata
        lea (%edx, %eax), %esi     #esi = inmatdata + 4*(r + c * matorder)

        mov -4(%ebp), %eax	   #eax = r
	imul %ebx, %eax		   #eax = r * matorder
	addl -8(%ebp), %eax        #eax = c + r * matorder
        lea (, %eax, 4), %edx      #edx = 4*(r + c * matorder)
        mov %edi, %eax             #eax = outmatdata
        lea (%edx, %eax), %edi    #edi = outmatdata + 4*(c + r * matorder)

       
        mov	(%esi), %eax		#eax<-m[rcx]
	mov	%eax, (%edi)		#m[rdx] <- m[eax]


continueForC:			#label pour la continuité de la boucle for avec c (la condition d'arrêt n'a pas été remplie)
	incl -8(%ebp) 		#On incrémente la valeur de c (++c)
	cmp -8(%ebp), %ebx	#Comparaison entre c et matorder
	ja forC			#Si matorder est plus grand que c, on refait la boucle
	movl $0, -8(%ebp)	#Sinon, c est réinitialisé à 0 avant la boucle for de r (avec r < matorder)

continueForR:			#label pour la continuité de la boucle for avec r (la condition d'arrêt n'a pas été remplie)
	incl -4(%ebp)		#On incrémente la valeur de r (++r)
	cmp -4(%ebp), %ebx	#Comparaison entre r et matorder
	ja forR			#Si matorder est plus grand que r, on refait la boucle. Sinon, aucun branchement n'est à faire et on sort.
        
epilogue:
	mov (%ebp), %ebx        # Rétablie ebx
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */



