.globl _ZNK7CCircle7AreaAsmEv

_ZNK7CCircle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
	movl 8(%ebp), %edx      #Le rayon r (1er argument) se trouve dans 8(%ebp). %edx = rayon
	fld 4(%edx)             #La variable du rayon va dans st[0]
        fld 4(%edx)             #On l'empile aussi afin qu'elle se retourve dans st[1]
        fmulp                   #On les multiplie. Le résultat,  r², est maintenant emmagasiné dans st[0]
	fldpi                   #La valeur de PI se trouve maintenant sur le dessus de la pile à st[1]
	fmulp	                #Multiplication entre r² et PI, le résultat est maintenant dans st[0]

	
epilogue:                       #Label délimitant les étapes pour la fin du programme
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
