.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        /* Write your solution here */
	movl	8(%ebp), %eax   #Le rayon va dans %eax
	flds	4(%eax)         
	fldpi
	fmulp	
        movl $factor, %eax
        pushl %eax
        fld (%eax)
        fmulp
	pop %eax
	
	


epliogue:
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
