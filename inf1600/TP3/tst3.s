	.file	"tst3.c"
	.text
	.globl	tst3
	.type	tst3, @function
tst3:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	#e
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)	#r = 0
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax	#eax = r
	cltq
	leaq	0(,%rax,4), %rdx	
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -4(%rbp)
.L2:
	cmpl	$3, -4(%rbp)
	jle	.L3
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	tst3, .-tst3
	.ident	"GCC: (GNU) 8.2.1 20181105 (Red Hat 8.2.1-5)"
	.section	.note.GNU-stack,"",@progbits
