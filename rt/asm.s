  .section .ResetTrampoline, "ax"
  .type ResetTrampoline, %function
  .global ResetTrampoline
ResetTrampoline:
  /* initialize registers */
  mov r0,#0
  mov r1,#0
  mov r2,#0
  mov r3,#0
  mov r4,#0
  mov r5,#0
  mov r6,#0
  mov r7,#0
  mov r8,#0
  mov r9,#0
  mov r10,#0
  mov r11,#0
  mov r12,#0
  ldr sp,=__stack_top__
  mov lr,#0
  b main

  .section .Vectors, "ax"
  .type Vectors, %function
  .global Vectors
Vectors:
  ldr pc, =ResetTrampoline
  ldr pc, 2f    /* Undefined */
  ldr pc, 3f    /* SVC */
  ldr pc, 4f    /* PrefetchAbort */
  ldr pc, 5f    /* DataAbort*/
1:b 1b          /* Reserved */
  ldr pc, 6f    /* IRQ */
  ldr pc, 7f    /* FIQ */
2:.word 8f      /* Undefined */
3:.word 9f      /* SVC */
4:.word 10f     /* PrefetchAbort */
5:.word 11f     /* DataAbort */
6:.word 12f     /* IRQ */
7:.word 13f     /* FIQ */

  .section .RamVectors, "ax"
  .type RamVectors, %function
  .global RamVectors
RamVectors:
8: ldr pc, 14f          /* Undefined */
9: ldr pc, 15f          /* SVC */
10:ldr pc, 16f          /* PrefetchAbort */
11:ldr pc, 17f          /* DataAbort */
12:ldr pc, 18f          /* IRQ */
13:ldr pc, 19f          /* FIQ */
14:.word UndefinedTrampoline
15:.word SVCTrampoline
16:.word PrefetchAbortTrampoline
17:.word DataAbortTrampoline
18:.word IRQ
19:.word FIQTrampoline

  .section .text.UndefinedTrampoline, "ax"
  .type UndefinedTrampoline, %function
  .global UndefinedTrampoline
UndefinedTrampoline:
  cps #19 /* switch back to the supervisor mode to reuse the previous stack */
  b Undefined

  .section .text.SVCTrampoline, "ax"
  .type SVCTrampoline, %function
  .global SVCTrampoline
SVCTrampoline:
  cps #19 /* switch back to the supervisor mode to reuse the previous stack */
  b SVC

  .section .text.PrefetchAbortTrampoline, "ax"
  .type PreftechAbortTrampoline, %function
  .global PrefetchAbortTrampoline
PrefetchAbortTrampoline:
  cps #19 /* switch back to the supervisor mode to reuse the previous stack */
  b PrefetchAbort

  .section .text.DataAbortTrampoline, "ax"
  .type DataAbortTrampoline, %function
  .global DataAbortTrampoline
DataAbortTrampoline:
  cps #19 /* switch back to the supervisor mode to reuse the previous stack */
  b DataAbort

/* TODO reentrant IRQ handler */

  .section .text.FIQTrampoline, "ax"
  .type FIQTrampoline, %function
  .global FIQTrampoline
FIQTrampoline:
  cps #19 /* switch back to the supervisor mode to reuse the previous stack */
  b FIQ
