.globl matrix_transpose_asm

matrix_transpose_asm:
	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */
        
	sub $8, %esp  				#espace alloué pour r et c
	movl $0, -4(%ebp)			#r=0
	movl $0, -8(%ebp)			#c=0
	
	mov 8(%ebp), %edi      	    #edi = inmatdata
	mov 12(%ebp), %esi			#esi = outmatdata
								#matorder est dans 16(%ebp)
continueForR:					#label pour la continuité de la boucle for avec r (la condition d'arrêt n'a pas été remplie)
						
	mov -4(%ebp), %eax			#eax = r
	cmp 16(%ebp), %eax			#Comparaison entre r et matorder
	jge epilogue				#si r est plus grand ou égal à matorder, le programme va vers l'épilogue
	movl $0, -8(%ebp)			#Sinon, on remet c à 0 pour recommencer la boucle forC

forC:	
	mov -8(%ebp), %eax	   		#eax = c
	cmp 16(%ebp), %eax	        #Comparaison entre c et matorder.Si c est plus grand ou égal à matorder, on va vers continueForC
	jge continueForC	   		#Branchement conditionnel vers continueForC, qui vérifie si la boucle forC est terminée

	mov -8(%ebp), %eax	   		#eax = c
	imul 16(%ebp), %eax	   		#eax = c * matorder
	mov %eax, %edx		   		#edx = eax = c * matorder
	mov -4(%ebp), %eax	  	    #eax = r
	addl %edx, %eax    	   	    #eax = r + c* matorder
	lea (, %eax,4), %edx        #edx = eax*4 = 4*(r+c*matorder)
	mov %edi, %eax	   			#eax = inmatdata
	lea (%edx, %eax), %ecx 	    #ecx = inmatdata + 4*(r + c* matorder), revient à inmatdata[r + c* matorder]

	mov -4(%ebp), %eax	   		#eax = r
	imul 16(%ebp), %eax	   		#eax = r * matorder
	mov %eax, %edx	            #edx = eax = r * matorder
	mov -8(%ebp), %eax	   		#eax = c
	addl %edx, %eax	   	   		#eax = c + r*matorder
	lea (, %eax,4), %edx 	    #ebx = eax *4 = 4*(c + r*matorder)
	mov 12(%ebp), %eax	  		#esi = outmatdata
	add %eax, %edx				#edx = outmatdata + 4*(c + r*matorder), revient à outmatdata[c + r*matorder]


	mov (%ecx), %eax	  		#eax = inmatdata[r + c* matorder]
	mov %eax, (%edx)	   		#inmatdata[r + c* matorder] = outmatdata[c + r*matorder]
			   					

	incl -8(%ebp)				#c est incrémenté
	jmp forC					#On retourne au début de la boucle forC pour une autre itération

continueForC:					#label pour la continuité de la boucle for avec r (la condition d'arrêt n'a pas été remplie)
	incl -4(%ebp)				#On incrémente r
    jmp continueForR			#Branchement vers continueForR, qui vérifie si forR est terminé

epilogue:
	mov (%ebp), %ebx
	leave          /* Restore ebp and esp */
	ret            /* Return to the caller */



