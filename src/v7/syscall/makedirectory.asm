.global main
.func main

.section .text

main:
  mov r7, #0x27
  ldr r0, =directory
  mov r1, #0666
  swi 0

  cmp r0, #0
  beq done

done:
  ldr r0, =out
  bl printf

exit:
  mov r7, #0x1
  mov r1, #65
  swi 0

.section .data
directory: .asciz "/home/electrondefuser/syscall_folder"
out: .asciz "Directory Created!\n"
