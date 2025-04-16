@/***************************************************************************
@ * Copyright (c) 2024 Microsoft Corporation 
@ * 
@ * This program and the accompanying materials are made available under the
@ * terms of the MIT License which is available at
@ * https://opensource.org/licenses/MIT.
@ * 
@ * SPDX-License-Identifier: MIT
@ **************************************************************************/
@
@
@/**************************************************************************/
@/**************************************************************************/
@/**                                                                       */
@/** ThreadX Component                                                     */
@/**                                                                       */
@/**   Initialize                                                          */
@/**                                                                       */
@/**************************************************************************/
@/**************************************************************************/
@
@
    .global     _tx_thread_system_stack_ptr
    .global     _tx_initialize_unused_memory
    .global     __RAM_segment_used_end__
    .global     _tx_timer_interrupt
    .global     __main
    .global     __tx_SVCallHandler
    .global     __tx_PendSVHandler
    .global     _vectors
    .global     __tx_NMIHandler                     @ NMI
    .global     __tx_BadHandler                     @ HardFault
    .global     __tx_SVCallHandler                  @ SVCall
    .global     __tx_DBGHandler                     @ Monitor
    .global     __tx_PendSVHandler                  @ PendSV
    .global     __tx_SysTickHandler                 @ SysTick
    .global     __tx_IntHandler                     @ Int 0
@
@
SYSTEM_CLOCK      =   170000000
SYSTICK_CYCLES    =   ((SYSTEM_CLOCK / 1000) -1)  @该值定义滴答时钟重载值

    .text 32
    .align 4
    .syntax unified
@/**************************************************************************/
@/*                                                                        */
@/*  FUNCTION                                               RELEASE        */
@/*                                                                        */
@/*    _tx_initialize_low_level                          Cortex-M4/GNU     */
@/*                                                           6.1          */
@/*  AUTHOR                                                                */
@/*                                                                        */
@/*    William E. Lamie, Microsoft Corporation                             */
@/*                                                                        */
@/*  DESCRIPTION                                                           */
@/*                                                                        */
@/*    This function is responsible for any low-level processor            */
@/*    initialization, including setting up interrupt vectors, setting     */
@/*    up a periodic timer interrupt source, saving the system stack       */
@/*    pointer for use in ISR processing later, and finding the first      */
@/*    available RAM memory address for tx_application_define.             */
@/*                                                                        */
@/*  INPUT                                                                 */
@/*                                                                        */
@/*    None                                                                */
@/*                                                                        */
@/*  OUTPUT                                                                */
@/*                                                                        */
@/*    None                                                                */
@/*                                                                        */
@/*  CALLS                                                                 */
@/*                                                                        */
@/*    None                                                                */
@/*                                                                        */
@/*  CALLED BY                                                             */
@/*                                                                        */
@/*    _tx_initialize_kernel_enter           ThreadX entry function        */
@/*                                                                        */
@/*  RELEASE HISTORY                                                       */
@/*                                                                        */
@/*    DATE              NAME                      DESCRIPTION             */
@/*                                                                        */
@/*  05-19-2020     William E. Lamie         Initial Version 6.0           */
@/*  09-30-2020     William E. Lamie         Modified Comment(s), fixed    */
@/*                                            GNU assembly comment,       */
@/*                                            cleaned up whitespace,      */
@/*                                            resulting in version 6.1    */
@/*                                                                        */
@/**************************************************************************/
@VOID   _tx_initialize_low_level(VOID)
@{
    .global  _tx_initialize_low_level
    .thumb_func
_tx_initialize_low_level:
@
@    /* Disable interrupts during ThreadX initialization.  */
@
    CPSID   i
@
@    /* Set base of available memory to end of non-initialised RAM area.  */
@    /* __RAM_segment_used_end__该全局变量应该定义为应用程序已分配内存的终点，空闲内存的起点 */
    LDR     r0, =_tx_initialize_unused_memory       @ Build address of unused memory pointer
    LDR     r1, =__RAM_segment_used_end__           @ Build first free address
    ADD     r1, r1, #4                              @
    STR     r1, [r0]                                @ Setup first unused memory pointer
@
@    /* Setup Vector Table Offset Register.  */
@    /* 如果需要设置中断向量表的位置，则直接在链接文件中设置app的起始地址即可， */
     /* 但需要注意的是在调用tx_kernel_enter() 函数前，不能使能任意中断，因为还没有正确的设置中断向量表的偏移地址 */
     /* 最保险的做法是在main函数最开始就设置中断向量表的偏移地址 */
    MOV     r0, #0xE000E000                         @ Build address of NVIC registers
    LDR     r1, =_vectors                           @ Pickup address of vector table
    STR     r1, [r0, #0xD08]                        @ Set vector table address
@
@    /* Set system stack pointer from vector value.  */
@    /* 系统堆栈指针初始化 */
    LDR     r0, =_tx_thread_system_stack_ptr        @ Build address of system stack pointer
    LDR     r1, =_vectors                           @ Pickup address of vector table
    LDR     r1, [r1]                                @ Pickup reset stack pointer
    STR     r1, [r0]                                @ Save system stack pointer
@
@    /* Enable the cycle count register.  */
@    /* DWT周期计数器启用 */
    LDR     r0, =0xE0001000                         @ Build address of DWT(Data Watchpoint and Trace) register
    LDR     r1, [r0]                                @ Pickup the current value
    ORR     r1, r1, #1                              @ Set the CYCCNTENA bit
    STR     r1, [r0]                                @ Enable the cycle count register
@
@    /* Configure SysTick for 100Hz clock, or 16384 cycles if no reference.  */
@
    MOV     r0, #0xE000E000                         @ Build address of NVIC registers
    LDR     r1, =SYSTICK_CYCLES
    STR     r1, [r0, #0x14]                         @ Setup SysTick Reload Value
    MOV     r1, #0x7                                @ Build SysTick Control Enable Value
    STR     r1, [r0, #0x10]                         @ Setup SysTick Control
@
@    /* Configure handler priorities.  */
@     异常类型	优先级值	作用	优先级策略
@     SysTick	0x40	系统节拍中断（1ms 定时）	较高优先级，确保准时触发
@     SVC	    0xFF	系统调用（任务创建/删除）	最低优先级，避免抢占
@     PendSV	0xFF	上下文切换（任务调度）	最低优先级，安全切换

    /* 配置 Cortex-M4 的 MemManage/BusFault/UsageFault 异常优先级（0x00:最高优先级） */
    LDR     r1, =0x00000000                         @ Rsrv, UsgF, BusF, MemM (System Handler Priority Register 1)
    STR     r1, [r0, #0xD18]                        @ Setup System Handlers 4-7 Priority Registers

    /* 设置SVCall（Supervisor Call）：优先级 0xFF（最低优先级） */
    LDR     r1, =0xFF000000                         @ SVCl, Rsrv, Rsrv, Rsrv (System Handler Priority Register 2)
    STR     r1, [r0, #0xD1C]                        @ Setup System Handlers 8-11 Priority Registers
                                                    @ Note: SVC must be lowest priority, which is 0xFF

    /* 设置SysTick（系统节拍定时器）：优先级 0x40（较高优先级，如优先级4） */
    /* 设置PendSV（可挂起的服务调用）：优先级 0xFF（最低优先级） */
    LDR     r1, =0x40FF0000                         @ SysT, PnSV, Rsrv, DbgM (System Handler Priority Register 3)
    STR     r1, [r0, #0xD20]                        @ Setup System Handlers 12-15 Priority Registers
                                                    @ Note: PnSV must be lowest priority, which is 0xFF

@
@    /* Return to caller.  */
@
    BX      lr
@}
@

@/* Define shells for each of the unused vectors.  */
@
    .global  __tx_BadHandler
    .thumb_func
__tx_BadHandler:
    B       __tx_BadHandler

@ /* added to catch the hardfault */

    .global  __tx_HardfaultHandler
    .thumb_func
__tx_HardfaultHandler:
    B       __tx_HardfaultHandler


@ /* added to catch the SVC */

    .global  __tx_SVCallHandler
    .thumb_func
__tx_SVCallHandler:
    B       __tx_SVCallHandler


@ /* Generic interrupt handler template */
    .global  __tx_IntHandler
    .thumb_func
__tx_IntHandler:
@ VOID InterruptHandler (VOID)
@ {
    PUSH    {r0, lr}
#ifdef TX_ENABLE_EXECUTION_CHANGE_NOTIFY
    BL      _tx_execution_isr_enter             @ Call the ISR enter function
#endif

@    /* Do interrupt handler work here */
@    /* BL <your C Function>.... */

#ifdef TX_ENABLE_EXECUTION_CHANGE_NOTIFY
    BL      _tx_execution_isr_exit              @ Call the ISR exit function
#endif
    POP     {r0, lr}
    BX      LR
@ }

@ /* System Tick timer interrupt handler */
    .global  __tx_SysTickHandler
    .global  SysTick_Handler
    .thumb_func
__tx_SysTickHandler:
    .thumb_func
SysTick_Handler:
@ VOID TimerInterruptHandler (VOID)
@ {
@
    PUSH    {r0, lr}
#ifdef TX_ENABLE_EXECUTION_CHANGE_NOTIFY
    BL      _tx_execution_isr_enter             @ Call the ISR enter function
#endif
    BL      _tx_timer_interrupt
#ifdef TX_ENABLE_EXECUTION_CHANGE_NOTIFY
    BL      _tx_execution_isr_exit              @ Call the ISR exit function
#endif
    POP     {r0, lr}
    BX      LR
@ }


@ /* NMI, DBG handlers */
    .global  __tx_NMIHandler
    .thumb_func
__tx_NMIHandler:
    B       __tx_NMIHandler

    .global  __tx_DBGHandler
    .thumb_func
__tx_DBGHandler:
    B       __tx_DBGHandler
