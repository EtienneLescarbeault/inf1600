.data
        diviseur: .float 2.0

.text
.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        subl $8, %esp           #Espace pour p, une variable locale
        movl 8(%ebp), %eax      #On met  un pointeur sur l'objet courant dans %eax
        push %eax               #this
        movl (%eax), %eax       #vtable
        addl $8, %eax           #appel de la fonction assembleur du périmètre, 2e dans la vtable
        call *(%eax)            #Calcul du périmètre du triangle
        
        movl $diviseur, %edx    #edx reçoit la valeur du diviseur
        push %edx               #Ce diviseur est mis sur le dessus de la pile
        fld (%edx)              #(%edx) dans st[0]
        fdivrp                  #Le périmètre est divisé par 2

        fstp -8(%ebp)           #Le résultat va dans p

        movl 8(%ebp), %eax      #array de côtés va dans eax
        fld 4(%eax)             #Premier côté dans st[0]
        fld -8(%ebp)            #La valeur de p va dans st[1]
        fsubp                   #p-msides[0] dans st[0]
        fstp (%edx)             #Mem[edx] reçoit le résultat de p-msides[0]

        fld 8(%eax)             #msides[1] dans st[0]
        fld -8(%ebp)            #p dans st[1]
        fsubp                   #p-msides[1] dans st[0]
        fld (%edx)              #La valeur de %edx va dans st[1]
        fmulp                   #(p-msides[0])*(p-msides[1])
        fstp (%edx)             #Mem[edx] reçoit le résultat de la multiplication 

        fld 12(%eax)            #msides[2] dans st[0]
        fld -8(%ebp)            #p dans st[1]
        fsubp                   #p-msides[2] dans st[0]
        fld (%edx)              #La valeur de (p-msides[0])*(p-msides[1]) dans st[1]
        fmulp                   #(p-msides[0])*(p-msides[1])*(p-msides[2]) dans st[0]
        
        fld -8(%ebp)            #p dans st[1]
        fmulp                   #p*((p-msides[0])*(p-msides[1])*(p-msides[2])) dans st[0] 
        fsqrt                   #Enfin, la racine carrée de la valeur à st[0] est mise dans st[0]

        pop %eax                #Rétablir %eax
        pop %edx                #Rétablir %edx
        addl $8, %esp           #Dépiler les paramètres

epilogue:
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
