	.file	"car.c"
	.text
	.globl	getComparator
	.type	getComparator, @function
getComparator:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$6, -4(%rbp)
	ja	.L2
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L4(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L4(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L2-.L4
	.long	.L9-.L4
	.long	.L8-.L4
	.long	.L7-.L4
	.long	.L6-.L4
	.long	.L5-.L4
	.long	.L3-.L4
	.text
.L9:
	leaq	cmpModelASC(%rip), %rax
	jmp	.L10
.L8:
	leaq	cmpModelDSC(%rip), %rax
	jmp	.L10
.L7:
	leaq	cmpMaxspeedASC(%rip), %rax
	jmp	.L10
.L6:
	leaq	cmpMaxspeedDSC(%rip), %rax
	jmp	.L10
.L5:
	leaq	cmpPriceASC(%rip), %rax
	jmp	.L10
.L3:
	leaq	cmpPriceDSC(%rip), %rax
	jmp	.L10
.L2:
	movl	$0, %eax
.L10:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	getComparator, .-getComparator
	.globl	randint
	.type	randint, @function
randint:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	call	rand@PLT
	movl	-8(%rbp), %edx
	subl	-4(%rbp), %edx
	leal	1(%rdx), %ecx
	cltd
	idivl	%ecx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	randint, .-randint
	.globl	randReal
	.type	randReal, @function
randReal:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	call	rand@PLT
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC0(%rip), %xmm2
	movapd	%xmm0, %xmm1
	divsd	%xmm2, %xmm1
	movsd	-16(%rbp), %xmm0
	subsd	-8(%rbp), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	randReal, .-randReal
	.globl	randomName
	.type	randomName, @function
randomName:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -16(%rbp)
	movl	$90, %esi
	movl	$65, %edi
	call	randint
	movl	%eax, %ecx
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	movl	$10, %esi
	movl	$4, %edi
	call	randint
	movl	%eax, -4(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L16
.L17:
	movl	$122, %esi
	movl	$97, %edi
	call	randint
	movl	%eax, %ecx
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	addl	$1, -12(%rbp)
.L16:
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L17
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$32, (%rax)
	movl	$10, %esi
	movl	$4, %edi
	call	randint
	movl	%eax, -4(%rbp)
	movl	$90, %esi
	movl	$65, %edi
	call	randint
	movl	%eax, %ecx
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	movl	$0, -8(%rbp)
	jmp	.L18
.L19:
	movl	$122, %esi
	movl	$97, %edi
	call	randint
	movl	%eax, %ecx
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	addl	$1, -8(%rbp)
.L18:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L19
	movl	-16(%rbp), %edx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	randomName, .-randomName
	.globl	cmpModelASC
	.type	cmpModelASC, @function
cmpModelASC:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	cmpModelASC, .-cmpModelASC
	.globl	cmpModelDSC
	.type	cmpModelDSC, @function
cmpModelDSC:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	cmpModelDSC, .-cmpModelDSC
	.globl	cmpMaxspeedASC
	.type	cmpMaxspeedASC, @function
cmpMaxspeedASC:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movzbl	21(%rax), %eax
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	movzbl	21(%rax), %eax
	movzbl	%al, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	cmpMaxspeedASC, .-cmpMaxspeedASC
	.globl	cmpMaxspeedDSC
	.type	cmpMaxspeedDSC, @function
cmpMaxspeedDSC:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	21(%rax), %eax
	movzbl	%al, %edx
	movq	-16(%rbp), %rax
	movzbl	21(%rax), %eax
	movzbl	%al, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	cmpMaxspeedDSC, .-cmpMaxspeedDSC
	.globl	cmpPriceASC
	.type	cmpPriceASC, @function
cmpPriceASC:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movsd	24(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movq	.LC1(%rip), %xmm1
	andpd	%xmm0, %xmm1
	movsd	.LC2(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L37
	movl	$0, %eax
	jmp	.L32
.L37:
	movq	-16(%rbp), %rax
	movsd	24(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L38
	movl	$1, %eax
	jmp	.L32
.L38:
	movl	$-1, %eax
.L32:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	cmpPriceASC, .-cmpPriceASC
	.globl	cmpPriceDSC
	.type	cmpPriceDSC, @function
cmpPriceDSC:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movsd	24(%rax), %xmm0
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movq	.LC1(%rip), %xmm1
	andpd	%xmm0, %xmm1
	movsd	.LC2(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L47
	movl	$0, %eax
	jmp	.L42
.L47:
	movq	-16(%rbp), %rax
	movsd	24(%rax), %xmm1
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L48
	movl	$1, %eax
	jmp	.L42
.L48:
	movl	$-1, %eax
.L42:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	cmpPriceDSC, .-cmpPriceDSC
	.section	.rodata
.LC3:
	.string	"Model is: %25s "
.LC4:
	.string	"Maximum speed is: %25u "
.LC5:
	.string	"Price is: %4lf "
	.text
	.globl	printCAR
	.type	printCAR, @function
printCAR:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movzbl	21(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	printCAR, .-printCAR
	.section	.rodata
	.align 8
.LC0:
	.long	-4194304
	.long	1105199103
	.align 16
.LC1:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC2:
	.long	-755914244
	.long	1062232653
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
