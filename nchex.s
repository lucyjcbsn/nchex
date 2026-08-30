section .data
	;cfg
	debug_cfg: db 1

	dbg_startmsg: db "Test", 0
	err1: db "Error, unable to open binary", 0
	search_err1: db "Address invalid", 0

section .text
	global main
	extern interface
	extern input
	extern convert

main:
	mov eax, [debug_cfg]
	cmp eax, 0
	jne run_no_startmsg
	;start routine
	mov rax, 1
	mov rdi, 1
	mov rsi, [dbg_startmsg]
	mov rdx, 5

	run_no_startmsg:
		
	
	


interface:
		
input:

convert:

file:
	
