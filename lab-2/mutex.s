	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
    @ INSERT CODE BELOW
    ldr r3, =#1
.loop:
    ldrex r2, [r0]
    cmp r2, #0
    strexeq r2, r3, [r0]
    @cmp r2, #1
    bne .loop
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
    ldr r3, =#0
    str r3, [r0]
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
