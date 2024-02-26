.global main
.func main

.section .text

main:
  bl func
  bl exit

func:
  push {r4-r11, lr}
  mov fp, sp
  sub sp, sp, #0x8

  mov r2, #10
  mov r3, #40

  strd r2, r3, [sp]
  ldrd r0, r1, [sp]

  add r4, r0, r1,
  
  ldr r0, =addmsg
  mov r1, r4
  bl printf

  ldrd r0, r1, [sp]
  sub r4, r1, r0

  ldr r0, =submsg
  mov r1, r4
  bl printf

  mov sp, fp
  pop {r4-r11, lr}

exit:
  push {fp, lr}

  mov r7, #0x1
  mov r0, #65
  swi 0

  pop {fp, lr}

.section .data
addmsg: .asciz "(ADD): R0, R1 := %i"
submsg: .asciz "(SUB): R0, R1 := %i"
