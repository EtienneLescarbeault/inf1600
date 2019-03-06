	.file	"tst.c"
	.text
	.globl	ptr
	.type	ptr, @function
ptr:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp) #int* adr1
	movq	%rsi, -16(%rbp) #int* adr2
	movl	%edx, -20(%rbp) #int c
	movl	%ecx, -24(%rbp)	#int r
	movl	%r8d, -28(%rbp) #int mat
	movl	-20(%rbp), %eax #eax <- c
	imull	-28(%rbp), %eax #eax <- c * mat
	movl	%eax, %edx		#edx <- eax
	movl	-24(%rbp), %eax	#eax <- r
	addl	%edx, %eax		#eax <- r+c*mat
	cltq
	leaq	0(,%rax,4), %rdx #rdx <- rax*4
	movq	-16(%rbp), %rax	 #rax <- adr2
	leaq	(%rdx,%rax), %rcx#rcx <- adr2+rax*4
	movl	-24(%rbp), %eax	 #eax <- r
	imull	-28(%rbp), %eax	  #eax <- mat *r
	movl	%eax, %edx			#edx <- eax
	movl	-20(%rbp), %eax   #eax <- c
	addl	%edx, %eax			#eax <- mat*r+c
	cltq
	leaq	0(,%rax,4), %rdx	#rdx <- rax*4
	movq	-8(%rbp), %rax		#rax <- adr1
	addq	%rax, %rdx			#rdx <- rax+rdx, adr1+ rax*4
	movl	(%rcx), %eax		#eax<-m[rcx]
	movl	%eax, (%rdx)		#m[rdx] <- m[eax]
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	ptr, .-ptr
	.ident	"GCC: (GNU) 8.2.1 20181105 (Red Hat 8.2.1-5)"
	.section	.note.GNU-stack,"",@progbits
