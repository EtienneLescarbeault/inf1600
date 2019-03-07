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
.L5:						#continue forC
	movl	-4(%rbp), %eax	#r = eax
	cmpl	-36(%rbp), %eax # r plus grand ou egal a matorder?
	jge	.L6				#vers l'epilogue
	movl	$0, -8(%rbp)	#sinon, c = 0
.L4:						#forC
	movl	-8(%rbp), %eax	#eax = c
	cmpl	-36(%rbp), %eax	#c plus grand ou egal a matorder?
	jge	.L3					#increm c, retour vers  continueforC

	movl	-8(%rbp), %eax	#eax = c
	imull	-36(%rbp), %eax	#eax = c*matorder
	movl	%eax, %edx		#edx = eax
	movl	-4(%rbp), %eax	#eax = r
	addl	%edx, %eax		#eax = r + c* matorder
	cltq
	leaq	0(,%rax,4), %rdx #edx = eax * 4 = 4*(r+c*matorder)
	movq	-24(%rbp), %rax		#eax = inmatdata
	leaq	(%rdx,%rax), %rcx	#ecx = eax + edx

	movl	-4(%rbp), %eax 		#eax = r
	imull	-36(%rbp), %eax 	#eax = r * matorder
	movl	%eax, %edx			#edx = r* matorder
	movl	-8(%rbp), %eax		#eax = c
	addl	%edx, %eax			#eax = c + r* matorder
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx

	movl	(%rcx), %eax
	movl	%eax, (%rdx)
	
	addl	$1, -8(%rbp)
	jmp	.L4
.L3:
	addl	$1, -4(%rbp) #r = r+1
	jmp	.L5				 #vers continue forC
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
