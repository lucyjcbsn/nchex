section .bss
	readbuffer: resb 4096
	twbuffer: resb 12288


section .data
	;cfg
	debug_cfg: db 1

	;const strings
	byte_conv: db "0123456789ABCDEF"

	dbg_startmsg: db "test no init", 10, 0
	err1: db "Error, unable to open binary", 10, 0
	;search_err1: db "Address invalid", 10, 0

section .text
	global main

main:
	cmp byte [debug_cfg], 1
	jne read_init
	;test
	push rdi
	push rsi
	mov rax, 1
	mov rdi, 1
	mov rsi, dbg_startmsg
	mov rdx, 13
	syscall
	pop rsi
	pop rdi
	
read_init:
	cmp rdi, 2
	jl exit

	mov rsi, [rsi + 8]
	;sesame
	mov rax, 2
	mov rdi, rsi
	xor rsi, rsi
	xor rdx, rdx
	
	syscall

	cmp rax, 0
	jnl read

	jmp exit

read:
	mov r12, rax

	mov rax, 0
	mov rdi, r12
	mov rsi, readbuffer
	mov rdx, 4096
	syscall

	cmp rax, 0
	jle exit

	mov r13, rax ; read
	mov r14, 0 ;index
	mov r15, 0 ;out

convert:

	;char1
	mov rax, rbx
	shr rax, 4
	mov al, byte [byte_conf + rax]

	;char2
	
exit:

	mov rax, 3
	mov rdi, r12
	syscall

	mov rax, 60
	mov rdi, 0
	syscall


