.global main
.func main

.section .text

main:
  mov r0, #1

exit:
  mov r7, #0x1
  mov r0, #65
  swi 0

.section .data
smsg: .asciz "Connect to %s at port %i\n"
port: .int 8080
host: .asciz "127.0.0.1"
