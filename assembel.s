	.file	"testfile.cpp"
	.text
	.globl	main
	.type	main,@function
main:
	pushq   %rbp
	movq    %rsp,%rbp
	subq    $32,%rsp
	movq    %fs:40,%rax
	movq    %rax,-8(%rbp)
	xorl    %eax,%eax
	movq	$10,-32(%rbp)
	movq	$11,-24(%rbp)
	movq	$11,-32(%rbp)
	movq    -8(%rbp),%rdx
	xorq    %fs:40,%rdx
	je      endofproc_main
	call    __stack_chk_fail@PLT
endofproc_main: 
	leave
	ret
	.size	main,.-main
	.ident		"GNU C Like Simple C Compiler"
	.section	.note.GNU-stack,"",@progbits