.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        movl 8(%ebp), %edx      #L'adresse de l'objet Triangle va dans %edx
        fld 4(%edx)             #Le premier élément de l'attribut  msides[3], msides[0], va à st[0]
        fld 8(%edx)             #Le deuxième élément du tableau, msides[1] va à st[1]
        faddp                   #On les additionne, le résultat (msides[0] + misides[1] est rangé dans st[0]
        fld 12(%edx)            #Le troisième élément, msides[2], va dans st[1]
        faddp                   #On les additionne, le résultat (msides[0]+msides[1]+msides[2]) va dans st[0]

epilogue:                       #Label délimitant la fin du programme
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
