.global main
.func main

.section .text

main:
    push {r4, lr}

    ldr r4, =val
    ldr r4, [r4]

    ldr r0, =msg
    mov r1, r4
    bl printf

loop:
    cmp r4, #0
    beq exit
    
    ldr r0, =msg
    mov r1, r4
    bl printf
  
    sub r4, r4, #1
    b loop

exit:
    pop {r4, pc}

    mov r7, #0x1
    mov r0, #65
    swi 0

.section .data
msg: .asciz "Loop: %i\n"
val: .int 5
