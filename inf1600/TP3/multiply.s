.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        sub $16, %esp           #Place pour r, c, i, elem
        movl $0, -4(%ebp)       #r = 0   
        movl $0, -8(%ebp)       #c = 0
        movl $0, -12(%ebp)      #i =0
        movl $0, -16(%ebp)      #elem = 0

        #mov -16(%ebp), %edx     #edi = elem
        #mov 8(%ebp), %edi       #edi - inmatdata1
	#mov 12(%ebp), %esi	#esi = inmatdata2
        #mov 16(%ebp), %ebx      #edx = outmatdata
        #matorder est dans 20(%ebp)


       # movl	$0, -4(%ebp)		#r = 0
	#jmp	epilogue		


continueForR:
        movl -4(%ebp), %eax		#eax = r
	cmp 20(%ebp), %eax		#comp entre r et matorder
	jge epilogue	
	movl $0, -8(%ebp)		#c = 0
	jmp continueForC

ForC:
	movl	$0, -16(%ebp)		#elem  =0
	movl	$0, -12(%ebp)		#i = 0
	jmp	continueForI
ForI:
	mov	-4(%ebp), %eax		#eax =r
	imul	20(%ebp), %eax		#eax = r*matorder
	mov	%eax, %edx			#edx = r*matorder
	mov	-12(%ebp), %eax		#eax = i
	add	%edx, %eax			#eax  = i+r*matorder
							#####################
	lea	(,%eax,4), %edx	#edx = eax*4
	movl	8(%ebp), %eax		#eax = inmatdata1
	addl	%edx, %eax			#eax = inmatdata1+4*(i+r*matorder)
	mov	(%eax), %edx		#edx = inmatdata1[i+r*matorder]

	movl	-12(%ebp), %eax		#eax = i
	imul	20(%ebp), %eax		#eax = i*matorder
	mov	%eax, %ecx			#ecx = eax = i*matroder
	movl	-8(%ebp), %eax		#eax = c
	add	%ecx, %eax			#eax = c+i*matorder
							###########################
	lea	(,%eax,4), %ecx	#ecx = 4*eax
	movl	12(%ebp), %eax		#eax = inmatdata2
	add	%ecx, %eax			#eax = inmatdata2 + 4*(c+i*matorder)
	mov	(%eax), %eax		#eax = inmatdata2[c+i*matorder]

	imul	%edx, %eax			#eax = inmatdata1[i+r*matorder] * inmatdata2[c+i*matorder]
	addl	%eax, -16(%ebp)		#elem = elem + inmatdata1[i+r*matorder] * inmatdata2[c+i*matorder]
	addl	$1, -12(%ebp)		#increm i
continueForI:
	movl	-12(%ebp), %eax		#eax = i
	cmpl	20(%ebp), %eax		#comp entr i et matorder
	jl	ForI						#si i est moins que matorder, vers l5
	movl	-4(%ebp), %eax		#eax = r
	imull	20(%ebp), %eax		#eax = r*matorder
	movl	%eax, %edx			#edx = r*matorder
	movl	-8(%ebp), %eax		#eax = c
	addl	%edx, %eax			#eax  =c+r*matorder
	
	lea	(,%eax,4), %edx	#edx = eax*4= 4*(c+r*matorder)
	mov	16(%ebp), %eax		#eax = outmatdata
	add	%eax, %edx			#edx = outmatdata + 4*(c+r*matorder)
	movl	-16(%ebp), %eax		#eax = elem
	mov	%eax, (%edx)		#outmatdata[c+r*matorder] = elem
	addl	$1, -8(%ebp)		#increm c
continueForC:
	movl	-8(%ebp), %eax		#eax = c
	cmp	20(%ebp), %eax		#comp entre matorder et c
	jl	ForC						#si matorder est plus bas que c, vers L6
	addl	$1, -4(%ebp)		#increm r
        jmp continueForR

epilogue:
	mov (%ebp), %ebx
	leave          /* Restore ebp and esp */
	ret            /* Return to the caller */
