.global matrix_row_aver_asm

matrix_row_aver_asm:
    push %ebp      			/* Save old base pointer */
    mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
    sub $12, %esp  				#espace alloué pour r et c
	movl $0, -4(%ebp)			#r=0
	movl $0, -8(%ebp)			#c=0
    movl $0, -12(%ebp)          #elem = 0
	
	movl 8(%ebp), %esi      	#inmatdata
	movl 12(%ebp), %edi		    #outmatdata
    #16(%ebp)          matorder
ForR:
    mov -4(%ebp), %eax			#eax = r
	cmp 16(%ebp), %eax			#Comparaison entre r et matorder
	jge epilogue				#si r est plus grand ou égal à matorder, le programme va vers l'épilogue
	movl $0, -12(%ebp)
    movl $0, -8(%ebp)			#Sinon, on remet c à 0 pour recommencer la boucle forC

forC:
    mov -8(%ebp), %eax	   		#eax = c
	cmp 16(%ebp), %eax	        #Comparaison entre c et matorder.Si c est plus grand ou égal à matorder, on va vers continueForC
	jge continueForC	   		#Branchement conditionnel vers continueForC, qui vérifie si la boucle forC est terminée

    mov -4(%ebp), %eax          #eax = r
    imul 16(%ebp), %eax         #eax = r*matorder
    mov %eax, %edx              #edx = r*matorder
    mov -8(%ebp), %eax          #eax = c
    addl %edx, %eax             #eax = c+r*matorder
    lea (, %eax, 4), %edx       #edx = eax*4
   # mov 8(%ebp), %eax           #eax = inmatdata
    lea (%edx, %esi), %eax
    mov (%eax), %edx

    addl %edx, -12(%ebp)
    incl -8(%ebp)
    jmp forC

continueForC:					#label pour la continuité de la boucle for avec r (la condition d'arrêt n'a pas été remplie)
    
    mov -4(%ebp), %eax
    lea (, %eax, 4), %edx       #edx = 4*r
    #mov 12(%ebp), %eax          #eax = outmatdata
    lea (%edx, %edi), %ecx      #ecx = outmatdata + 4*r

    movw $0, %dx
    mov -12(%ebp), %ax         #eax = elem
    mov 16(%ebp), %bx
    div %bx
    mov %eax, (%ecx)


    incl -4(%ebp)				#On incrémente r
    jmp ForR			#Branchement vers continueForR, qui vérifie si forR est terminé

epilogue:
	mov (%ebp), %ebx
    leave          			/* Restore ebp and esp */
    ret           			/* Return to the caller */
		