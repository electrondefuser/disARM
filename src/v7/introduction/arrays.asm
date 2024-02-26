.global main
.func main

.section .text

main:
    mov r6, #0  @ loop counter
    mov r7, #0  @ used for indexing into the array

    ldr r8, =arr

loop:
    cmp r6, #5
    beq func
  
    ldr r4, [r8, r7]

    ldr r0, =out
    mov r1, r6
    mov r2, r4
    bl printf

    add r3, r4, r4

    add r7, r7, #4
    add r6, r6, #1

    b loop

func:
    ldr r0, =tot
    mov r1, r3
    bl printf

exit:
    mov r7, #0x1
    mov r0, #65
    swi 0


.section .data
out: .asciz "Index at %i: %i\n"
tot: .asciz "Total of elements in the array: %i\n"
arr: .int 10, 20, 30, 40, 50

