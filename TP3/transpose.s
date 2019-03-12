.globl matrix_transpose_asm

matrix_transpose_asm:
	push %ebp      				/* save old base pointer */
	mov %esp, %ebp 				/* set ebp to current esp */
        
	sub $8, %esp  				#espace alloué pour r et c dans la pile, 2 entiers de 4 octets chacuns
	movl $0, -4(%ebp)			#r=0 afin d'initialiser la boucle forR
	#c est dans -8(%ebp)
	mov 8(%ebp), %edi      	    #edi = inmatdata
	mov 12(%ebp), %esi			#esi = outmatdata
	#matorder est dans 16(%ebp)

forR:							#label pour la continuité de la boucle for avec r 
	mov -4(%ebp), %eax			#eax = r
	cmp 16(%ebp), %eax			#Comparaison entre r et matorder
	je epilogue				    #si r est égal à matorder, le programme va vers l'épilogue, la boucle forR est terminée.
	movl $0, -8(%ebp)			#Sinon, on remet c à 0 pour recommencer la boucle forC

forC:	
	mov -8(%ebp), %eax	   		#eax = c
	cmp 16(%ebp), %eax	        #Comparaison entre c et matorder.Si c est  égal à matorder, on va vers continueForR
	je continueForR	   		    #Branchement conditionnel vers continueForR, qui fera recommencer la boucle forR

	mov -8(%ebp), %eax	   		#eax = c
	imul 16(%ebp), %eax	   		#eax = c * matorder
	mov -4(%ebp), %edx	  	    #edx = r
	addl %edx, %eax    	   	    #eax = r + c*matorder
	lea (, %eax,4), %edx        #edx = eax*4 = 4*(r+c*matorder)
	lea (%edx, %edi), %ecx 	    #ecx = inmatdata + 4*(r + c* matorder), revient à inmatdata[r + c* matorder]

	mov -4(%ebp), %eax	   		#eax = r
	imul 16(%ebp), %eax	   		#eax = r * matorder
	mov -8(%ebp), %edx	   		#edx = c
	addl %edx, %eax	   	   		#eax = c + r*matorder
	lea (, %eax,4), %edx 	    #edx = eax *4 = 4*(c + r*matorder)
	lea (%esi, %edx), %edx		#edx = outmatdata + 4*(c + r*matorder), revient à outmatdata[c + r*matorder]

	mov (%ecx), %eax	  		#eax = Mem[inmatdata[r + c* matorder]]
	mov %eax, (%edx)	   		#Mem[inmatdata[r + c* matorder]] = Mem[outmatdata[c + r*matorder]]
			   					
	incl -8(%ebp)				#c est incrémenté (++c)
	jmp forC					#On retourne au début de la boucle forC pour une autre itération

continueForR:					#Label pour recommencer la boucle forR
	incl -4(%ebp)				#On incrémente r (++r)
    jmp forR					#Branchement vers forR, qui vérifiera si fla boucle est terminée

epilogue:
	leave          				/* Restore ebp and esp */
	ret            				/* Return to the caller */



