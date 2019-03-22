.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        movl 8(%ebp), %edx      #Le tableau de côtés va dans %edx
        fld 4(%edx)             #Le premier élément va sà st[0]
        fld 8(%edx)             #Le deuxième élément va à st[1]
        faddp                   #On les additionne, le résultat est rangé dans st[0]
        fld 12(%edx)            #Le troisième élément va dans st[1]
        faddp                   #On les additionne, le résultat va dans st[0]

epilogue:
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
