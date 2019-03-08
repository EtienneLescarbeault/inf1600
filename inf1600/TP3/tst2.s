	.file	"tst2.c"
	.text
	.globl	matrix_multiply
	.type	matrix_multiply, @function
matrix_multiply:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)		#inmatdata1
	movq	%rsi, -32(%rbp)		#inmatdata2
	movq	%rdx, -40(%rbp)		#outmatdata
	movl	%ecx, -44(%rbp)		#matorder
	movl	$0, -4(%rbp)		#r = 0
	jmp	.L2						
.L7:
	movl	$0, -8(%rbp)		#c = 0
	jmp	.L3
.L6:
	movl	$0, -16(%rbp)		#elem  =0
	movl	$0, -12(%rbp)		#i = 0
	jmp	.L4
.L5:
	movl	-4(%rbp), %eax		#eax =r
	imull	-44(%rbp), %eax		#eax = r*matorder
	movl	%eax, %edx			#edx = r*matorder
	movl	-12(%rbp), %eax		#eax = i
	addl	%edx, %eax			#eax  = i+r*matorder
	cltq						#####################
	leaq	0(,%rax,4), %rdx	#edx = eax*4
	movq	-24(%rbp), %rax		#eax = inmatdata1
	addq	%rdx, %rax			#eax = inmatdata1+4*(i+r*matorder)
	movl	(%rax), %edx		#edx = inmatdata1[i+r*matorder]

	movl	-12(%rbp), %eax		#eax = i
	imull	-44(%rbp), %eax		#eax = i*matorder
	movl	%eax, %ecx			#ecx = eax = i*matroder
	movl	-8(%rbp), %eax		#eax = c
	addl	%ecx, %eax			#eax = c+i*matorder
	cltq						###########################
	leaq	0(,%rax,4), %rcx	#ecx = 4*eax
	movq	-32(%rbp), %rax		#eax = inmatdata2
	addq	%rcx, %rax			#eax = inmatdata2 + 4*(c+i*matorder)
	movl	(%rax), %eax		#eax = inmatdata2[c+i*matorder]

	imull	%edx, %eax			#eax = inmatdata1[i+r*matorder] * inmatdata2[c+i*matorder]
	addl	%eax, -16(%rbp)		#elem = elem + inmatdata1[i+r*matorder] * inmatdata2[c+i*matorder]
	addl	$1, -12(%rbp)		#increm i
.L4:
	movl	-12(%rbp), %eax		#eax = i
	cmpl	-44(%rbp), %eax		#comp entr i et matorder
	jl	.L5						#si i est moins que matorder, vers l5
	movl	-4(%rbp), %eax		#eax = r
	imull	-44(%rbp), %eax		#eax = r*matorder
	movl	%eax, %edx			#edx = r*matorder
	movl	-8(%rbp), %eax		#eax = c
	addl	%edx, %eax			#eax  =c+r*matorder
	cltq
	leaq	0(,%rax,4), %rdx	#edx = eax*4= 4*(c+r*matorder)
	movq	-40(%rbp), %rax		#eax = outmatdata
	addq	%rax, %rdx			#edx = outmatdata + 4*(c+r*matorder)
	movl	-16(%rbp), %eax		#eax = elem
	movl	%eax, (%rdx)		#outmatdata[c+r*matorder] = elem
	addl	$1, -8(%rbp)		#increm c
.L3:
	movl	-8(%rbp), %eax		#eax = c
	cmpl	-44(%rbp), %eax		#comp entre matorder et c
	jl	.L6						#si matorder est plus bas que c, vers L6
	addl	$1, -4(%rbp)		#increm r
.L2:
	movl	-4(%rbp), %eax		#eax = r
	cmpl	-44(%rbp), %eax		#comp entre r et matorder
	jl	.L7						#si r est plus bas que matorder, vers .L7
	nop							#sinon fin du prog
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	matrix_multiply, .-matrix_multiply
	.ident	"GCC: (GNU) 8.2.1 20181105 (Red Hat 8.2.1-5)"
	.section	.note.GNU-stack,"",@progbits
