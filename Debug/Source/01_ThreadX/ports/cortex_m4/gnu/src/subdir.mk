################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_initialize_low_level.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_misra.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_context_restore.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_context_save.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_control.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_disable.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_restore.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_schedule.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_stack_build.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_system_return.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_timer_interrupt.S 

OBJS += \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_initialize_low_level.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_misra.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_context_restore.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_context_save.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_control.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_disable.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_restore.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_schedule.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_stack_build.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_system_return.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_timer_interrupt.o 

S_UPPER_DEPS += \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_initialize_low_level.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_misra.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_context_restore.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_context_save.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_control.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_disable.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_restore.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_schedule.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_stack_build.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_system_return.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_timer_interrupt.d 


# Each subdirectory must supply rules for building sources it contributes
Source/01_ThreadX/ports/cortex_m4/gnu/src/%.o: ../Source/01_ThreadX/ports/cortex_m4/gnu/src/%.S Source/01_ThreadX/ports/cortex_m4/gnu/src/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Source-2f-01_ThreadX-2f-ports-2f-cortex_m4-2f-gnu-2f-src

clean-Source-2f-01_ThreadX-2f-ports-2f-cortex_m4-2f-gnu-2f-src:
	-$(RM) ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_initialize_low_level.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_initialize_low_level.o ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_misra.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_misra.o ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_context_restore.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_context_restore.o ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_context_save.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_context_save.o ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_control.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_control.o ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_disable.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_disable.o ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_restore.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_interrupt_restore.o ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_schedule.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_schedule.o ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_stack_build.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_stack_build.o ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_system_return.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_thread_system_return.o ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_timer_interrupt.d ./Source/01_ThreadX/ports/cortex_m4/gnu/src/tx_timer_interrupt.o

.PHONY: clean-Source-2f-01_ThreadX-2f-ports-2f-cortex_m4-2f-gnu-2f-src

