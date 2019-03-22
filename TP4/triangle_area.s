.data
        diviseur: .float 2.0

.text
.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        subl $8, %esp
        movl 8(%ebp), %eax
        push %eax               #this
        movl (%eax), %eax       #vtable
        addl $8, %eax           #appel de la fonction assembleur du périmètre, 2e dans la vtable
        call *(%eax)            #Calcul du périmètre du triangle
        
        movl $diviseur, %edx
        push %edx
        fld (%edx)              #(%edx) dans st[0]
        fdivrp                  #Le périmètre est divisé par 2

        fstp -8(%ebp)           #Le résultat va dans p

        movl 8(%ebp), %eax      #array de côtés va dans eax
        fld 4(%eax)             #Premier côté dans st[0]
        fld -8(%ebp)
        fsubp                  #p-side[0] dans st[0]
        fstp (%edx)

        fld 8(%eax)             #side[1] dans st[0]
        fld -8(%ebp)            #p dans st[1]
        fsubp                  #p-side[1] dans st[0]
        fld (%edx)
        fmulp
        fstp (%edx)

        fld 12(%eax)
        fld -8(%ebp)
        fsubp
        fld (%edx)
        fmulp
        
        fld -8(%ebp)
        fmulp
        fsqrt

        addl $8, %esp
        
epilogue:
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
