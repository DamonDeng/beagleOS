.arch armv5te
.global	start_armboot

.equ CONSOLE_ADDR, 0x49020000	

.text
.align	2

start_armboot:
	ldr 	r1,=CONSOLE_ADDR
	adr	r0,message
messageloop:
	ldrb	r2,[r0],#0x1
	str	r2,[r1]
	cmp 	r2,#0x0
	bne	messageloop;
dieloop:
	b	dieloop

.align	2
message:
	.ascii "12345Hello world , I am writen for BeagleBoard..\n\0"

