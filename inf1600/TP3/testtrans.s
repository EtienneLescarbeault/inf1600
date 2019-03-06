	.file	"testtrans.cpp"
	.text
	.globl	_Z16matrix_transposePKiPii
	.type	_Z16matrix_transposePKiPii, @function
_Z16matrix_transposePKiPii:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.L6
	movl	$0, -8(%rbp)
.L4:
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.L3
	movl	-8(%rbp), %eax
	imull	-36(%rbp), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	imull	-36(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	(%rcx), %eax
	movl	%eax, (%rdx)
	addl	$1, -8(%rbp)
	jmp	.L4
.L3:
	addl	$1, -4(%rbp)
	jmp	.L5
.L6:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z16matrix_transposePKiPii, .-_Z16matrix_transposePKiPii
	.ident	"GCC: (GNU) 8.2.1 20181105 (Red Hat 8.2.1-5)"
	.section	.note.GNU-stack,"",@progbits
