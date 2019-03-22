	.file	"triangle.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.section	.text._ZN6CShapeD2Ev,"axG",@progbits,_ZN6CShapeD5Ev,comdat
	.align 2
	.weak	_ZN6CShapeD2Ev
	.type	_ZN6CShapeD2Ev, @function
_ZN6CShapeD2Ev:
.LFB1004:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	$_ZTV6CShape+8, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1004:
	.size	_ZN6CShapeD2Ev, .-_ZN6CShapeD2Ev
	.weak	_ZN6CShapeD1Ev
	.set	_ZN6CShapeD1Ev,_ZN6CShapeD2Ev
	.section	.text._ZN6CShapeD0Ev,"axG",@progbits,_ZN6CShapeD5Ev,comdat
	.align 2
	.weak	_ZN6CShapeD0Ev
	.type	_ZN6CShapeD0Ev, @function
_ZN6CShapeD0Ev:
.LFB1006:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	_ZN6CShapeD1Ev
	addl	$16, %esp
	subl	$8, %esp
	pushl	$4
	pushl	8(%ebp)
	call	_ZdlPvj
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1006:
	.size	_ZN6CShapeD0Ev, .-_ZN6CShapeD0Ev
	.section	.text._ZN6CShapeC2Ev,"axG",@progbits,_ZN6CShapeC5Ev,comdat
	.align 2
	.weak	_ZN6CShapeC2Ev
	.type	_ZN6CShapeC2Ev, @function
_ZN6CShapeC2Ev:
.LFB1238:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	$_ZTV6CShape+8, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1238:
	.size	_ZN6CShapeC2Ev, .-_ZN6CShapeC2Ev
	.weak	_ZN6CShapeC1Ev
	.set	_ZN6CShapeC1Ev,_ZN6CShapeC2Ev
	.text
	.align 2
	.globl	_ZN9CTriangleC2EPf
	.type	_ZN9CTriangleC2EPf, @function
_ZN9CTriangleC2EPf:
.LFB1240:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	_ZN6CShapeC2Ev
	addl	$16, %esp
	movl	$_ZTV9CTriangle+8, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	flds	(%eax)
	movl	8(%ebp), %eax
	fstps	4(%eax)
	movl	12(%ebp), %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	fstps	8(%eax)
	movl	12(%ebp), %eax
	flds	8(%eax)
	movl	8(%ebp), %eax
	fstps	12(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1240:
	.size	_ZN9CTriangleC2EPf, .-_ZN9CTriangleC2EPf
	.globl	_ZN9CTriangleC1EPf
	.set	_ZN9CTriangleC1EPf,_ZN9CTriangleC2EPf
	.align 2
	.globl	_ZN9CTriangleD2Ev
	.type	_ZN9CTriangleD2Ev, @function
_ZN9CTriangleD2Ev:
.LFB1243:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	$_ZTV9CTriangle+8, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	_ZN6CShapeD2Ev
	addl	$16, %esp
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1243:
	.size	_ZN9CTriangleD2Ev, .-_ZN9CTriangleD2Ev
	.globl	_ZN9CTriangleD1Ev
	.set	_ZN9CTriangleD1Ev,_ZN9CTriangleD2Ev
	.align 2
	.globl	_ZN9CTriangleD0Ev
	.type	_ZN9CTriangleD0Ev, @function
_ZN9CTriangleD0Ev:
.LFB1245:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	_ZN9CTriangleD1Ev
	addl	$16, %esp
	subl	$8, %esp
	pushl	$16
	pushl	8(%ebp)
	call	_ZdlPvj
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1245:
	.size	_ZN9CTriangleD0Ev, .-_ZN9CTriangleD0Ev
	.align 2
	.globl	_ZNK9CTriangle12PerimeterCppEv
	.type	_ZNK9CTriangle12PerimeterCppEv, @function
_ZNK9CTriangle12PerimeterCppEv:
.LFB1246:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	flds	8(%eax)
	faddp	%st, %st(1)
	movl	8(%ebp), %eax
	flds	12(%eax)
	faddp	%st, %st(1)
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1246:
	.size	_ZNK9CTriangle12PerimeterCppEv, .-_ZNK9CTriangle12PerimeterCppEv
	.align 2
	.globl	_ZNK9CTriangle7AreaCppEv
	.type	_ZNK9CTriangle7AreaCppEv, @function
_ZNK9CTriangle7AreaCppEv:
.LFB1247:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	flds	.LC1
	fdivrp	%st, %st(1)
	fstps	-12(%ebp)
	movl	8(%ebp), %eax
	flds	4(%eax)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fmuls	-12(%ebp)
	movl	8(%ebp), %eax
	flds	8(%eax)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fmulp	%st, %st(1)
	movl	8(%ebp), %eax
	flds	12(%eax)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fmulp	%st, %st(1)
	subl	$8, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	call	sqrt
	addl	$16, %esp
	fstps	-28(%ebp)
	flds	-28(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1247:
	.size	_ZNK9CTriangle7AreaCppEv, .-_ZNK9CTriangle7AreaCppEv
	.align 2
	.globl	_ZNK9CTriangle9HeightCppEv
	.type	_ZNK9CTriangle9HeightCppEv, @function
_ZNK9CTriangle9HeightCppEv:
.LFB1248:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	addl	$16, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	8(%ebp)
	call	*%eax
	addl	$16, %esp
	fstps	-12(%ebp)
	flds	-12(%ebp)
	fld	%st(0)
	faddp	%st, %st(1)
	movl	8(%ebp), %eax
	flds	12(%eax)
	fdivrp	%st, %st(1)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1248:
	.size	_ZNK9CTriangle9HeightCppEv, .-_ZNK9CTriangle9HeightCppEv
	.section	.rodata
.LC2:
	.string	"triangle"
	.text
	.align 2
	.globl	_ZNK9CTriangle4NameB5cxx11Ev
	.type	_ZNK9CTriangle4NameB5cxx11Ev, @function
_ZNK9CTriangle4NameB5cxx11Ev:
.LFB1249:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1249
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcEC1Ev
	addl	$16, %esp
	subl	$4, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	pushl	$.LC2
	pushl	8(%ebp)
.LEHB0:
	.cfi_escape 0x2e,0x10
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_
.LEHE0:
	addl	$16, %esp
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	jmp	.L17
.L16:
	movl	%eax, %ebx
	subl	$12, %esp
	leal	-9(%ebp), %eax
	pushl	%eax
	call	_ZNSaIcED1Ev
	addl	$16, %esp
	movl	%ebx, %eax
	subl	$12, %esp
	pushl	%eax
.LEHB1:
	call	_Unwind_Resume
.LEHE1:
.L17:
	movl	8(%ebp), %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE1249:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1249:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1249-.LLSDACSB1249
.LLSDACSB1249:
	.uleb128 .LEHB0-.LFB1249
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L16-.LFB1249
	.uleb128 0
	.uleb128 .LEHB1-.LFB1249
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE1249:
	.text
	.size	_ZNK9CTriangle4NameB5cxx11Ev, .-_ZNK9CTriangle4NameB5cxx11Ev
	.weak	_ZTV9CTriangle
	.section	.rodata._ZTV9CTriangle,"aG",@progbits,_ZTV9CTriangle,comdat
	.align 4
	.type	_ZTV9CTriangle, @object
	.size	_ZTV9CTriangle, 36
_ZTV9CTriangle:
	.long	0
	.long	_ZTI9CTriangle
	.long	_ZN9CTriangleD1Ev
	.long	_ZN9CTriangleD0Ev
	.long	_ZNK9CTriangle12PerimeterCppEv
	.long	_ZNK9CTriangle12PerimeterAsmEv
	.long	_ZNK9CTriangle7AreaCppEv
	.long	_ZNK9CTriangle7AreaAsmEv
	.long	_ZNK9CTriangle4NameB5cxx11Ev
	.weak	_ZTV6CShape
	.section	.rodata._ZTV6CShape,"aG",@progbits,_ZTV6CShape,comdat
	.align 4
	.type	_ZTV6CShape, @object
	.size	_ZTV6CShape, 36
_ZTV6CShape:
	.long	0
	.long	_ZTI6CShape
	.long	0
	.long	0
	.long	__cxa_pure_virtual
	.long	__cxa_pure_virtual
	.long	__cxa_pure_virtual
	.long	__cxa_pure_virtual
	.long	__cxa_pure_virtual
	.weak	_ZTI9CTriangle
	.section	.rodata._ZTI9CTriangle,"aG",@progbits,_ZTI9CTriangle,comdat
	.align 4
	.type	_ZTI9CTriangle, @object
	.size	_ZTI9CTriangle, 12
_ZTI9CTriangle:
	.long	_ZTVN10__cxxabiv120__si_class_type_infoE+8
	.long	_ZTS9CTriangle
	.long	_ZTI6CShape
	.weak	_ZTS9CTriangle
	.section	.rodata._ZTS9CTriangle,"aG",@progbits,_ZTS9CTriangle,comdat
	.align 4
	.type	_ZTS9CTriangle, @object
	.size	_ZTS9CTriangle, 11
_ZTS9CTriangle:
	.string	"9CTriangle"
	.weak	_ZTI6CShape
	.section	.rodata._ZTI6CShape,"aG",@progbits,_ZTI6CShape,comdat
	.align 4
	.type	_ZTI6CShape, @object
	.size	_ZTI6CShape, 8
_ZTI6CShape:
	.long	_ZTVN10__cxxabiv117__class_type_infoE+8
	.long	_ZTS6CShape
	.weak	_ZTS6CShape
	.section	.rodata._ZTS6CShape,"aG",@progbits,_ZTS6CShape,comdat
	.align 4
	.type	_ZTS6CShape, @object
	.size	_ZTS6CShape, 8
_ZTS6CShape:
	.string	"6CShape"
	.section	.rodata
	.align 4
.LC1:
	.long	1073741824
	.ident	"GCC: (GNU) 8.2.1 20181105 (Red Hat 8.2.1-5)"
	.section	.note.GNU-stack,"",@progbits
