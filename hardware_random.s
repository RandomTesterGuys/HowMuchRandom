//Compile just by using gcc hardware_random.s -o hrnd
// or whatever name you like... then run!
//


	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	leaq	L_.str(%rip), %rdi
	leaq	L_.str1(%rip), %rsi
	movabsq	$999, %rax              ## imm = 0x3E7
	cvtsi2ssq	%rax, %xmm0
	movl	$0, -4(%rbp)
	movl	$9, -8(%rbp)
	movss	%xmm0, -12(%rbp)
	callq	_fopen
	movq	%rax, -24(%rbp)
	movl	$0, -8(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$10000, -8(%rbp)        ## imm = 0x2710
	jge	LBB0_4
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str2(%rip), %rsi
	movabsq	$9223372036854775808, %rax       ## imm = 0x100000000
	cvtsi2sdq	%rax, %xmm0
	movq	-24(%rbp), %rdi
    rdrand  %rax
	cvtsi2ssq	%rax, %xmm0
	movss	%xmm0, -12(%rbp)
	cvtss2sd	-12(%rbp), %xmm1
//    rdrand  %r8
//    cvtsi2ssq   %r8, %xmm1
	divsd	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movb	$1, %al
	callq	_fprintf
	movl	%eax, -28(%rbp)         ## 4-byte Spill
## BB#3:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	LBB0_1
LBB0_4:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"output.txt"

L_.str1:                                ## @.str1
	.asciz	"w"

L_.str2:                                ## @.str2
	.asciz	"%f\n"


.subsections_via_symbols
