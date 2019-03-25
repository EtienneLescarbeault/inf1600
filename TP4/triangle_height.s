.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl	_ZNK9CTriangle9HeightAsmEv

_ZNK9CTriangle9HeightAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        subl $8, %esp           #Espace pour p, une variable locale
        movl 8(%ebp), %eax      #On met  un pointeur sur l'objet courant (adresse de l'objet de type triangle) dans %eax
        push %eax               #this est mis sur la pile
        movl (%eax), %eax       #vtable est maintenant pointée
        addl $16, %eax          #appel de la fonction assembleur de l'aire, à la position +16 de la vtable (triangle.vtable)
        call *(%eax)            #Calcul de l'aire du triangle avec la méthode virtuelle, mise dans st[0]

        fstp -8(%ebp)           #L'aire du triangle ainsi calculée de retrouve dans une variable locale, A (float)
      
        movl -8(%ebp), %eax     #a variable locale A est mise dans %eax
        movl $factor, %edx      #edx reçoit la valeur du facteur (2) de type float
        push %edx               #Ce facteur est mis sur le dessus de la pile
        fld (%edx)              #Mem[edx] dans st[0]
        fld -8(%ebp)            #La variable locale A est mise dans st[1]
        fmulp                   #Résultat de la multiplication dans st[0]

        movl 8(%ebp), %eax      #Le pointeur sur l'objet courant est mis dans %eax
        fld 12(%eax)            #msides[2] dans st[1]
        fdivrp                  #On divise st[0] par st[1]. Le résultat de la hauteur est mis dans st[0]

        pop %edx
        pop %eax
        
epilogue:        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
