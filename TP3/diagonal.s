.global matrix_diagonal_asm

matrix_diagonal_asm:
	push %ebp      				/* Save old base pointer */
	mov %esp, %ebp 				/* Set ebp to current esp */

	sub $8, %esp  				#espace alloué pour r et c
	movl $0, -4(%ebp)			#r=0 afin d'initiailiser la boucle forR
	#c est dans -8(%ebp)
	mov 8(%ebp), %edi           #edi = inmatdata
	mov 12(%ebp), %esi			#esi = outmatdata
	#matorder est dans 16(%ebp)

forR:							#label pour la continuité de la boucle for avec r					
	mov -4(%ebp), %eax			#eax = r
	cmp 16(%ebp), %eax			#Comparaison entre r et matorder
	je epilogue					#Si r et matorder sont égaux, branchement vers la fin du programme.
	movl $0, -8(%ebp)			#c = 0 afin d'initialiser la boucle forC

forC:	
	mov -8(%ebp), %eax	   		#eax = c
	cmp 16(%ebp), %eax	        #Comparaison entre c et matorder
	je continueForR	   		    #Si c et matorder sont égaux, branchement vers continueForR

	mov -4(%ebp), %eax			#eax = r
	mov -8(%ebp), %ebx			#ebx = c
	cmp %eax, %ebx				#comparaison entre r et c
	jne else					#S'ils ne sont pas égaux, jump vers la partie else. Sinon, on continue le programme avec les instructions ci-dessous.

	mov -8(%ebp), %eax	   		#eax = c
	imul 16(%ebp), %eax	   		#eax = c * matorder
	mov -4(%ebp), %edx	   		#edx = r
	addl %edx, %eax    	   		#eax = r + c* matorder
	lea (, %eax,4), %edx        #edx = eax*4 = 4*(r+c*matorder)
	lea (%edx, %edi), %ecx 	    #ecx = inmatdata + 4*(r + c* matorder), revient à inmatdata[r + c* matorder]

	mov -4(%ebp), %eax	   		#eax = r
	imul 16(%ebp), %eax	   		#eax = r * matorder
	mov -8(%ebp), %edx	   		#edx = c
	add %edx, %eax	   	   		#eax = c + r*matorder
	lea (, %eax,4), %edx 	    #edx = eax *4 = 4*(c + r*matorder)
	lea (%esi, %edx), %edx		#edx = outmatdata + 4*(c + r*matorder), revient à outmatdata[c + r*matorder]

	mov (%ecx), %eax	   		#eax = Mem[inmatdata[r + c* matorder]]
	mov %eax, (%edx)	   		#Mem[outmatdata[c+r*matorder]] =  Mem[inmatdata[r + c* matorder]]
	
	incl -8(%ebp)			    #incrémente c (++c)
	jmp forC		   			#On recommence la boucle forC

else:					   		#Label pour la partie else du if.
	mov -4(%ebp), %eax	   		#eax = r
	imul 16(%ebp), %eax	   		#eax = r * matorder	           
	mov -8(%ebp), %edx	   		#edx = c
	add %edx, %eax	   	   		#eax = c + r*matorder
	lea (, %eax,4), %edx 	    #ebx = eax *4 = 4*(c + r*matorder)
						        
	add %esi, %edx				#edx = outmatdata + 4*(c + r*matorder)
	movl $0, (%edx)				#Mem[outmatdata[c + r*matorder]] = 0

	incl -8(%ebp)				#On incrémente c (++c)
	jmp forC					#Retour au début vers la boucle forC

continueForR:					#label pour la continuité de la boucle for avec r
	incl -4(%ebp)			    #Incrémentation de r (++r)
    jmp forR				    #Retour vers la boucle forR

epilogue:						#Label pour la fin du programme
	#mov (%ebp), %ebx
	leave          /* Restore ebp and esp */
	ret            /* Return to the caller */	

		


