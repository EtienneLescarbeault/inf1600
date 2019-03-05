.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp			/* Save old base pointer */
        mov %esp, %ebp		/* Set ebp to current esp */

		sub $12, %esp   #espace alloué pour r et c

		movl $0, -8(%ebp)		#r=0
		movl $0, -12(%ebp)		#c=0

		mov 8(%ebp), %esi		#esi <- inmatdata1
		mov 12(%ebp), %edi		#edi <- inmatdata2
		mov 16(%ebp), %ebx		#ebx <- matorder

forR:
forC:
		mov -8(%ebp), %eax		#eax <- r
		mul %edx				#eax <-edx * eax, revient à: eax = r * matorder
		addl -12(%ebp), %eax    #eax = c + r* matorder
		mov %eax, (%esi)
		mov %eax, (%edi)
		cmp %esi, %edi
		jne retZero

continueForC:
		incl -12(%ebp) #c++
		cmp -12(%ebp), %ebx
		ja forC
		movl $0, -12(%ebp)

continueForR:
		incl -8(%ebp)
		cmp -8(%ebp), %ebx
		ja forR
		#mettre r à 0?

retUn:
		mov $1, %eax
		jmp epilogue
	
retZero:
		mov $0, %eax
		jmp epilogue

epilogue:
		mov -4(%ebp), %ebx
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */
