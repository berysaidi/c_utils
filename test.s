	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"%x\n"
.LC1:
	.string	"%d"
	.text
	.globl	bin_printf
	.type	bin_printf, @function
bin_printf:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$31, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, -4(%rbp)
	movl	-20(%rbp), %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	-4(%rbp), %eax
	addl	$1, %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L2
	movl	$32, %edi
	call	putchar
.L2:
	cmpl	$-1, -4(%rbp)
	jne	.L3
	movl	$10, %edi
	call	putchar
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	bin_printf, .-bin_printf
	.globl	printb
	.type	printb, @function
printb:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, %eax
	movb	%al, -44(%rbp)
	movzbl	-44(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L5
.L6:
	movq	-16(%rbp), %rax
	movl	(%rax), %esi
	movl	-4(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, -4(%rbp)
	movl	%eax, %ecx
	sarl	%cl, %esi
	movl	%esi, %eax
	andl	$1, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	-4(%rbp), %eax
	addl	$1, %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L5
	movl	$32, %edi
	call	putchar
.L5:
	cmpl	$-1, -4(%rbp)
	jne	.L6
	movl	$10, %edi
	call	putchar
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	printb, .-printb
	.globl	a
	.data
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.long	-1412567264
	.globl	b
	.align 4
	.type	b, @object
	.size	b, 4
b:
	.long	43981
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	a(%rip), %eax
	movl	%eax, %edi
	call	bin_printf
	movl	$16, %esi
	movl	$a, %edi
	call	printb
	movl	$16, %esi
	movl	$b, %edi
	call	printb
	movl	a(%rip), %eax
	sall	$24, %eax
	movl	%eax, %edx
	movl	a(%rip), %eax
	sarl	$8, %eax
	andl	$65280, %eax
	orl	%eax, %edx
	movl	a(%rip), %eax
	sall	$8, %eax
	andl	$16711680, %eax
	orl	%edx, %eax
	movl	%eax, %edx
	movl	a(%rip), %eax
	shrl	$24, %eax
	orl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, a(%rip)
	movl	a(%rip), %eax
	movl	%eax, %edi
	call	bin_printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
