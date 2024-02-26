.global main
.func main

.section .text

main:
	ldr r6, =struct01

	printints:
		mov r0, #0
		ldr r3, [r6, r0]

		ldr r0, =outinteger
		mov r1, r3
		bl printf

		ldr r3, [r6, #4]

		ldr r0, =outinteger
		mov r1, r3
		bl printf

	printword:
		mov r0, #8
		ldr r3, [r6, r0]

		ldr r0, =outword
		mov r1, r3
		bl printf

	printstrg:
		mov r0, #12
		mov r5, #0

		copystr:
			ldrb r3, [r6, r0]
			cmp r3, #0x0
			beq readstr

			ldr r2, =strcopy
			strb r3, [r2, r5]

			add r0, r0, #1
			add r5, r5, #1
			b copystr

		readstr:
			ldr r0, =outstring
			ldr r1, =strcopy
			bl printf

exit:
	mov r7, #0x1
	mov r0, #65
	swi 0

.section .data

/* 
	Total size of struct: 16 bytes 
		- 2 * int 	  (4 bytes each) 		  = 8  bytes
		- 1 * word 	  (2 bytes each) 		  = 2  bytes
		- 1 * string  (1 byte per character)  = 6  bytes
*/

struct01:
	.int  10
	.int  20
	.word 15
	.string "Hello, World!"

outinteger: .string "Integer value: %i\n"
outstring:  .string "String value:  %s\n"
outword:    .string "Word value:    %i\n"

strcopy: 	.string ""