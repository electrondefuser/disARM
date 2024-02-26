.global main
.func main

.section .text

main:
    bl func
    bl exit

func:
    push {r4-r11, lr}

    mov fp, sp
    sub sp, sp, #0x10

    mov r0, #10
    mov r1, #10

    add r3, r0, r1
    str r3, [fp, #-0x4]

    ldr r0, =msg
    ldr r1, [fp, #-0x4]
    bl printf

    mov sp, fp
    pop {r4-r11, pc}

exit:
    push {fp, lr}

    mov r7, #0x1
    mov r0, #65
    swi 0
  
    pop {fp, pc}

.section .data
msg: .asciz "Value: %i\n"
