.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        /* Write your solution here */
	movl 8(%ebp), %edx   #Le rayon va dans %eax
	flds 4(%edx)         
	fldpi
	fmulp	
        movl $factor, %edx
        pushl %edx
        fld (%edx)
        fmulp
	pop %edx
	
	


epliogue:
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
