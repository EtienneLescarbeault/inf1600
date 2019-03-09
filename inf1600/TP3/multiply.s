.globl matrix_multiply_asm

matrix_multiply_asm:
    push %ebp      				/* save old base pointer */
    mov %esp, %ebp 				/* set ebp to current esp */
        
    /* Write your solution here */
    sub $16, %esp           	#Place pour r, c, i, elem
    movl $0, -4(%ebp)       	#r = 0   
    movl $0, -8(%ebp)       	#c = 0
    movl $0, -12(%ebp)      	#i =0
    movl $0, -16(%ebp)      	#elem = 0

	movl 8(%ebp), %esi			#inmatdata1 est dans esi
	movl 12(%ebp), %edi			#inmatdata2 est dans edi
	#outmatdata est dans 16(%ebp)
	#matorder est dans 20(%ebp)

forR:							#Label pour la boucle avec r < matorder				
    movl -4(%ebp), %eax			#eax = r
	cmp 20(%ebp), %eax			#Comparaison entre r et matorder
	je epilogue					#Si r est égal à matorder, branchement vers l'épilogue pour la fin du programme
	movl $0, -8(%ebp)			#Sinon, c = 0 afin d'initialiser la boucle forC

forC:							#Label pour la boucle avec c < matorder	
	mov -8(%ebp), %eax			#eax = c
	cmp 20(%ebp), %eax			#Comparaison entre c et matorder
	je continueforC				#Si matorder et c sont égaux, branchement vers continueForC

	movl	$0, -16(%ebp)		#Sinon, elem = 0
	movl	$0, -12(%ebp)		#i = 0 afin d'initialiser la boucle forI

forI:							#Label pour la boucle avec i < matorder	
	mov -12(%ebp), %eax			#eax = i
	cmp 20(%ebp), %eax			#Comparaison entre matorder et i
	je continueforI				#S'ils sont égaux, la boucle forI est terminée et on fait ce qui est dessous.

	mov	-4(%ebp), %eax			#eax = r
	imul 20(%ebp), %eax			#eax = r*matorder
	mov	-12(%ebp), %edx			#edx = i
	add	%edx, %eax				#eax  = i+r*matorder			
	lea	(,%eax,4), %edx			#edx = eax*4 = 4*(i+r*matorder)
	lea (%edx, %esi), %ebx		#ebx = inmatdata1 + 4*(i+r*matorder), revient à inmatdata1[i+r*matorder]

	movl -12(%ebp), %eax		#eax = i
	imul 20(%ebp), %eax			#eax = i*matorder
	movl -8(%ebp), %edx			#edx = c
	add	%edx, %eax				#eax = c+i*matorder			
	lea	(,%eax,4), %ecx			#ecx = 4*eax
	lea (%ecx, %edi), %eax		#eax = inmatdata2 + 4*(c+i*matorder), revient à inmatdata2[c+i*matorder]

	mov (%ebx), %edx			#edx = Mem[inmatdata1[i+r*matorder]]
	mov (%eax), %ebx			#ebx = Mem[inmatdata2[c+i*matorder]]

	imul %edx, %ebx				#ebx = Mem[inmatdata1[i+r*matorder]] * Mem[inmatdata2[c+i*matorder]]
	addl %ebx, -16(%ebp)		#elem = elem + ebx

	incl -12(%ebp)				#i est incrémenté (++i)
    jmp forI					#On recommence la boucle forI

continueforI:					#Label pour la continuit. de la boucle forI
	movl -4(%ebp), %eax			#eax = r
	imul 20(%ebp), %eax			#eax = r*matorder
	movl -8(%ebp), %edx			#edx = c
	add %edx, %eax				#eax  = c + r*matorder
	lea	(,%eax,4), %edx			#edx = eax*4 = 4*(c+r*matorder)
	addl 16(%ebp), %edx		    #edx = outmatdata + 4*(c+r*matorder)
	movl -16(%ebp), %eax		#eax = elem
	mov	%eax, (%edx)			#Mem[outmatdata[c+r*matorder]] = elem

	incl -8(%ebp)				#c est incrémenté (++c)
	jmp forC					#La boucle forC est recommencée

continueforC:					#Label qui s'occupe de faire recommencer la boucle forC
	incl -4(%ebp)				#r est incrémenté (++r)
    jmp forR					#On retourne à la boucle forR afin de faire recommencer forC.

epilogue:						#Label pour fin de programme
	leave          				/* Restore ebp and esp */
	ret            				/* Return to the caller */
