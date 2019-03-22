.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        /* Write your solution here */
	movl 8(%ebp), %edx      #Le rayon va dans %edx
	fld 4(%edx)             #Cette variable est mise à st[0] de FPU
	fldpi                   #La valeur de PI est ensuite empilée et occuppe st[1]
	fmulp	                #Le rayon et PI sont multipliés. Le résultat va dans st[0].
        movl $factor, %edx      #Le facteur (2.0) va dans %edx
        pushl %edx              #%edx est maintenant sur le dessus de la pile
        fld (%edx)              #Mem[edx], égal à 2, est mis à st[1]
        fmulp                   #st[0] et st[1] sont multipliés pour donner 2*PI*r, le périmètre d'un cercle. Ce résultat est dans st[0]
	
epliogue:
        pop %edx                #On rétabli %edx
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
