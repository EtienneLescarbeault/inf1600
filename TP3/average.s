.global matrix_row_aver_asm

matrix_row_aver_asm:
    push %ebp      			/* Save old base pointer */
    mov %esp, %ebp 			/* Set ebp to current esp */

	/* Write your solution here */
    sub $12, %esp  				#espace alloué pour r, c et elem
	movl $0, -4(%ebp)			#r=0
	movl $0, -8(%ebp)			#c=0
    movl $0, -12(%ebp)          #elem = 0
	
	movl 8(%ebp), %esi      	#inmatdata
	movl 12(%ebp), %edi		    #outmatdata
    #matorder est dans 16(%ebp)

ForR:                           #Label pour la boucle avec r < matorder
    mov -4(%ebp), %eax			#eax = r
	cmp 16(%ebp), %eax			#Comparaison entre r et matorder
	je epilogue				    #Si r est  égal à matorder, le programme va vers l'épilogue
	movl $0, -12(%ebp)          #Sinon, elem tombe à 0.
    movl $0, -8(%ebp)			#Puis on remet c à 0 pour recommencer la boucle forC

ForC:                           #Label pour la boucle avec c < matorder
    mov -8(%ebp), %eax	   		#eax = c
	cmp 16(%ebp), %eax	        #Comparaison entre c et matorder.Si c est égal à matorder, on va vers continueForC
	je continueForC	   		    #Branchement conditionnel vers continueForC, qui vérifie si la boucle forC est terminée

    mov -4(%ebp), %eax          #eax = r
    imul 16(%ebp), %eax         #eax = r*matorder
    mov -8(%ebp), %edx          #edx = c
    addl %edx, %eax             #eax = c+r*matorder
    lea (, %eax, 4), %edx       #edx = eax*4 = 4*(c+r*matorder)
    lea (%edx, %esi), %eax      #eax = inmatdata +4*(c+r*matorder)
    mov (%eax), %edx            #edx = Mem[inmatdata[c+r*matorder]]

    addl %edx, -12(%ebp)        #elem = elem + Mem[inmatdata[c+r*matorder]]
    incl -8(%ebp)               #incrémentation de c (++c)
    jmp ForC                    #retour au début de la boucle

continueForC:	                #Label pour la continuité de la boucle forC				
    mov -4(%ebp), %eax          #eax = r
    lea (, %eax, 4), %edx       #edx = eax*4 = 4*r
    lea (%edx, %edi), %ecx      #ecx = outmatdata + 4*r

    movw $0, %dx                #La valeur 0 va dans le registre dx, de 16 bits (2 octets, 1 word). Utiisé puisque la division prend dx:ax pour un total de 4 octets.
    mov -12(%ebp), %ax          #La valeur de elem va dans le registre de 2 octets ax        
    mov 16(%ebp), %bx           #La valeur de matorder va dans le registre de 2 octets bx
    div %bx                     #Effectue la division (dx:ax)/bx (elem/matorder), et place le quotient dans le registre ax à 2 octets.
    mov %eax, (%ecx)            #outmatdata[r] = eax = elem/matorder. On fait le déplacement d'un registre à 32 bits vers un autre. eax contient ax.

    incl -4(%ebp)			    #On incrémente r (++r)
    jmp ForR			        #On recommence la boucle 

epilogue:
    leave          			/* Restore ebp and esp */
    ret           			/* Return to the caller */
		