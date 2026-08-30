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
	mov rax, 60
	mov rdi, 0
	syscall
