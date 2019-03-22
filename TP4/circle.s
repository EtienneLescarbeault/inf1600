	.file	"circle.cpp"
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
	.globl	_ZN7CCircleC2Ef
	.type	_ZN7CCircleC2Ef, @function
_ZN7CCircleC2Ef:
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
	movl	$_ZTV7CCircle+8, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	flds	12(%ebp)
	fstps	4(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1240:
	.size	_ZN7CCircleC2Ef, .-_ZN7CCircleC2Ef
	.globl	_ZN7CCircleC1Ef
	.set	_ZN7CCircleC1Ef,_ZN7CCircleC2Ef
	.align 2
	.globl	_ZN7CCircleD2Ev
	.type	_ZN7CCircleD2Ev, @function
_ZN7CCircleD2Ev:
.LFB1243:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	$_ZTV7CCircle+8, %edx
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
	.size	_ZN7CCircleD2Ev, .-_ZN7CCircleD2Ev
	.globl	_ZN7CCircleD1Ev
	.set	_ZN7CCircleD1Ev,_ZN7CCircleD2Ev
	.align 2
	.globl	_ZN7CCircleD0Ev
	.type	_ZN7CCircleD0Ev, @function
_ZN7CCircleD0Ev:
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
	call	_ZN7CCircleD1Ev
	addl	$16, %esp
	subl	$8, %esp
	pushl	$8
	pushl	8(%ebp)
	call	_ZdlPvj
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1245:
	.size	_ZN7CCircleD0Ev, .-_ZN7CCircleD0Ev
	.align 2
	.globl	_ZNK7CCircle12PerimeterCppEv
	.type	_ZNK7CCircle12PerimeterCppEv, @function
_ZNK7CCircle12PerimeterCppEv:
.LFB1246:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %eax
	flds	4(%eax)
	fldl	.LC1
	fmulp	%st, %st(1)
	fstps	-4(%ebp)
	flds	-4(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1246:
	.size	_ZNK7CCircle12PerimeterCppEv, .-_ZNK7CCircle12PerimeterCppEv
	.align 2
	.globl	_ZNK7CCircle7AreaCppEv
	.type	_ZNK7CCircle7AreaCppEv, @function
_ZNK7CCircle7AreaCppEv:
.LFB1247:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %eax
	flds	4(%eax)
	fldl	.LC2
	fmulp	%st, %st(1)
	movl	8(%ebp), %eax
	flds	4(%eax)
	fmulp	%st, %st(1)
	fstps	-4(%ebp)
	flds	-4(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1247:
	.size	_ZNK7CCircle7AreaCppEv, .-_ZNK7CCircle7AreaCppEv
	.section	.rodata
.LC3:
	.string	"circle"
	.text
	.align 2
	.globl	_ZNK7CCircle4NameB5cxx11Ev
	.type	_ZNK7CCircle4NameB5cxx11Ev, @function
_ZNK7CCircle4NameB5cxx11Ev:
.LFB1248:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1248
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
	pushl	$.LC3
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
	jmp	.L15
.L14:
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
.L15:
	movl	8(%ebp), %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret	$4
	.cfi_endproc
.LFE1248:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1248:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1248-.LLSDACSB1248
.LLSDACSB1248:
	.uleb128 .LEHB0-.LFB1248
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L14-.LFB1248
	.uleb128 0
	.uleb128 .LEHB1-.LFB1248
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE1248:
	.text
	.size	_ZNK7CCircle4NameB5cxx11Ev, .-_ZNK7CCircle4NameB5cxx11Ev
	.weak	_ZTV7CCircle
	.section	.rodata._ZTV7CCircle,"aG",@progbits,_ZTV7CCircle,comdat
	.align 4
	.type	_ZTV7CCircle, @object
	.size	_ZTV7CCircle, 36
_ZTV7CCircle:
	.long	0
	.long	_ZTI7CCircle
	.long	_ZN7CCircleD1Ev
	.long	_ZN7CCircleD0Ev
	.long	_ZNK7CCircle12PerimeterCppEv
	.long	_ZNK7CCircle12PerimeterAsmEv
	.long	_ZNK7CCircle7AreaCppEv
	.long	_ZNK7CCircle7AreaAsmEv
	.long	_ZNK7CCircle4NameB5cxx11Ev
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
	.weak	_ZTI7CCircle
	.section	.rodata._ZTI7CCircle,"aG",@progbits,_ZTI7CCircle,comdat
	.align 4
	.type	_ZTI7CCircle, @object
	.size	_ZTI7CCircle, 12
_ZTI7CCircle:
	.long	_ZTVN10__cxxabiv120__si_class_type_infoE+8
	.long	_ZTS7CCircle
	.long	_ZTI6CShape
	.weak	_ZTS7CCircle
	.section	.rodata._ZTS7CCircle,"aG",@progbits,_ZTS7CCircle,comdat
	.align 4
	.type	_ZTS7CCircle, @object
	.size	_ZTS7CCircle, 9
_ZTS7CCircle:
	.string	"7CCircle"
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
	.align 8
.LC1:
	.long	1413754136
	.long	1075388923
	.align 8
.LC2:
	.long	1413754136
	.long	1074340347
	.ident	"GCC: (GNU) 8.2.1 20181105 (Red Hat 8.2.1-5)"
	.section	.note.GNU-stack,"",@progbits
