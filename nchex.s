section .data
	;cfg
	debug_cfg: db 1

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

	mov rdi, 1
	mov rsi, err1
	mov rdx, 30
	jmp exit
read:
	mov r12, rax
	cmp byte [rsi + rcx], 0
	je bin_get
	inc rcx
	jne read

bin_get:
	mov rax, 1
	mov rdi, 1
	mov rdx, rcx
	syscall

exit:
	syscall

	mov rax, 60
	mov rdi, 0
	syscall


