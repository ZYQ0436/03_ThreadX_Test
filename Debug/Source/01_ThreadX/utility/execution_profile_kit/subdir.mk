################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Source/01_ThreadX/utility/execution_profile_kit/tx_execution_profile.c 

OBJS += \
./Source/01_ThreadX/utility/execution_profile_kit/tx_execution_profile.o 

C_DEPS += \
./Source/01_ThreadX/utility/execution_profile_kit/tx_execution_profile.d 


# Each subdirectory must supply rules for building sources it contributes
Source/01_ThreadX/utility/execution_profile_kit/%.o Source/01_ThreadX/utility/execution_profile_kit/%.su Source/01_ThreadX/utility/execution_profile_kit/%.cyclo: ../Source/01_ThreadX/utility/execution_profile_kit/%.c Source/01_ThreadX/utility/execution_profile_kit/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I../Source/01_ThreadX/common/inc -I../Source/01_ThreadX/ports/cortex_m4/gnu/inc -I../Source/01_ThreadX/utility/execution_profile_kit -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Source-2f-01_ThreadX-2f-utility-2f-execution_profile_kit

clean-Source-2f-01_ThreadX-2f-utility-2f-execution_profile_kit:
	-$(RM) ./Source/01_ThreadX/utility/execution_profile_kit/tx_execution_profile.cyclo ./Source/01_ThreadX/utility/execution_profile_kit/tx_execution_profile.d ./Source/01_ThreadX/utility/execution_profile_kit/tx_execution_profile.o ./Source/01_ThreadX/utility/execution_profile_kit/tx_execution_profile.su

.PHONY: clean-Source-2f-01_ThreadX-2f-utility-2f-execution_profile_kit

