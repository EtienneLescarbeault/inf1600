.globl matrix_transpose_asm

matrix_transpose_asm:
	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */
        
	sub $8, %esp  		#espace alloué pour r et c
	movl $0, -4(%ebp)	#r=0
	
	mov 8(%ebp), %edi       #edi - inmatdata
	mov 16(%ebp), %esi	#esi = outmatdata
continueForC:			#label pour la continuité de la boucle for avec c (la condition d'arrêt n'a pas été remplie)
				#On incrémente la valeur de c (++c)
	mov -4(%ebp), %eax			#Comparaison entre c et matorde
	cmp 16(%ebp), %eax
	jge epilogue
	movl $0, -8(%ebp)	

forC:	
	mov -8(%ebp), %eax	   #eax = r
	cmp 16(%ebp), %eax	           #r plus grand ou egal à matorder?
	jge continueForR	   #on sort de la boucle forC, branchement vers la boucle R

	mov -8(%ebp), %eax	   #eax = c
	imul 16(%ebp), %eax	   #eax = c * matorder
	mov %eax, %edx		   #edx = eax = c*matorder
	mov -4(%ebp), %eax	   #eax = r
	addl %edx, %eax    	   #eax = r + c* matorder
	lea (, %eax,4), %edx       #ebx = eax*4 = 4*(r+c*matorder)
	mov %edi, %eax	   #eax = inmatdata
	lea (%edx, %eax), %ecx 	   #ecx = inmatdata + 4*(r + c* matorder)

	mov -4(%ebp), %eax	   #eax = r
	imul 16(%ebp), %eax	   #eax = r * matorder
	mov %eax, %edx	           #edx = eax = r * matorder
	mov -8(%ebp), %eax	   #eax = c
	addl %edx, %eax	   	   #eax = c + r*matorder
	lea (, %eax,4), %edx 	   #ebx = eax *4
	mov 12(%ebp), %eax	   #esi = outmatdata
	add %eax, %edx


	mov (%ecx), %eax	   #eax<-m[edi]
	mov %eax, (%edx)	   #m[eax] <- m[edi]
			   	#ces deux dernières lignes font outmatdata[c + r * matorder] = inmatdata[r + c * matorder]

	addl $1, -8(%ebp)	#Si matorder est plus grand que c, on refait la boucle
	jmp forC			#Sinon, c est réinitialisé à 0 avant la boucle for de r (avec r < matorder)

continueForR:			#label pour la continuité de la boucle for avec r (la condition d'arrêt n'a pas été remplie)
	addl $1, -4(%ebp)		#Si matorder est plus grand que r, on refait la boucle. Sinon, aucun branchement n'est à faire et on sort.
        jmp continueForC

epilogue:
	mov (%ebp), %ebx
	leave          /* Restore ebp and esp */
	ret            /* Return to the caller */



