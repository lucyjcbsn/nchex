section .data
	;cfg
	debug_cfg: db 1

	dbg_startmsg: db "test no init", 10, 0
	;err1: db "Error, unable to open binary", 0
	;search_err1: db "Address invalid", 0

section .text
	global main

main:

	cmp byte [debug_cfg], 1
	jne init
	;test
	mov rax, 1
	mov rdi, 1
	mov rsi, dbg_startmsg
	mov rdx, 13
	syscall
	
	init:
	;DEBUG TIL 37

	xor rax, rax
		
	arg_str_read:
	cmp byte ptr [rsi + rax], 0
	inc rcx
	jne arg_str_read
	
	mov rax, 1
	mov rdi, 1
	mov rsi, rcx
	mov rdx, 
	syscall

	mov rax, 60
	mov rdi, 0
	syscall


