################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Source/01_ThreadX/ports/cortex_m4/gnu/example_build/cortexm4_crt0.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/example_build/cortexm4_vectors.S \
../Source/01_ThreadX/ports/cortex_m4/gnu/example_build/tx_initialize_low_level.S 

OBJS += \
./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/cortexm4_crt0.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/cortexm4_vectors.o \
./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/tx_initialize_low_level.o 

S_UPPER_DEPS += \
./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/cortexm4_crt0.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/cortexm4_vectors.d \
./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/tx_initialize_low_level.d 


# Each subdirectory must supply rules for building sources it contributes
Source/01_ThreadX/ports/cortex_m4/gnu/example_build/%.o: ../Source/01_ThreadX/ports/cortex_m4/gnu/example_build/%.S Source/01_ThreadX/ports/cortex_m4/gnu/example_build/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Source-2f-01_ThreadX-2f-ports-2f-cortex_m4-2f-gnu-2f-example_build

clean-Source-2f-01_ThreadX-2f-ports-2f-cortex_m4-2f-gnu-2f-example_build:
	-$(RM) ./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/cortexm4_crt0.d ./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/cortexm4_crt0.o ./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/cortexm4_vectors.d ./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/cortexm4_vectors.o ./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/tx_initialize_low_level.d ./Source/01_ThreadX/ports/cortex_m4/gnu/example_build/tx_initialize_low_level.o

.PHONY: clean-Source-2f-01_ThreadX-2f-ports-2f-cortex_m4-2f-gnu-2f-example_build

