.global main
.func main

.section .text

main:
  mov r7, #0x26
  ldr r0, =oldname
  ldr r1, =newname
  swi 0

  cmp r0, #0
  beq done

done:
  ldr r0, =out
  bl printf

exit:
  mov r7, #0x1
  mov r0, #65
  swi 0

.section .data
oldname: .asciz "/home/electrondefuser/syscall_folder"
newname: .asciz "/home/electrondefuser/newname"
out:     .asciz "Rename successful!\n"
