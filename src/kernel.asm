bits 32
section .text
	align 4
	dd 0x1badb002
	dd 0x00
	dd - (0x1badb002+0x00)
global start
extern flagmain			;function from kernel.c
start:
	cli
	call flagmain
	hlt

