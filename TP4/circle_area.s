.globl _ZNK7CCircle7AreaAsmEv

_ZNK7CCircle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
	movl 8(%ebp), %edx      #Le rayon r (1er argument) se trouve dans 8(%ebp). %edx = rayon
	fld 4(%edx)             #
        fld 4(%edx)             #
        fmulp                   #
	fldpi                   #La valeur de PI se trouve maintenant sur le dessus de la pile
	fmulp	                #Multiplication entre r² et PI, le résultat est maintenant dans

	
epilogue:   
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
