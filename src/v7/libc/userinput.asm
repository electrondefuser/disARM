.global main
.func main

.section .text

main:
    ask_num1:
        ldr r0, =userask1
        bl printf

        ldr r0, =input1
        ldr r1, =num1
        bl scanf

    ask_num2:
        ldr r0, =userask2
        bl printf

        ldr r0, =input2
        ldr r1, =num2
        bl scanf

    ldr r0, =num1
    ldr r1, =num2

    ldr r0, [r0]
    ldr r1, [r1]

    add r3, r0, r1

    ldr r0, =out
    mov r1, r3
    bl printf

exit:
    mov r7, #0x1
    mov r0, #65
    swi 0

.section .data
out: .asciz "Total: %i\n"

userask1: .string "Enter Num1: "
userask2: .string "Enter Num2: "

input1: .asciz "%i"
input2: .asciz "%i"

num1: .int 0
num2: .int 0
