################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../usr/cpp_main.cpp \
../usr/ledStatus.cpp \
../usr/nbt.cpp \
../usr/ringbuffer.cpp 

OBJS += \
./usr/cpp_main.o \
./usr/ledStatus.o \
./usr/nbt.o \
./usr/ringbuffer.o 

CPP_DEPS += \
./usr/cpp_main.d \
./usr/ledStatus.d \
./usr/nbt.d \
./usr/ringbuffer.d 


# Each subdirectory must supply rules for building sources it contributes
usr/%.o: ../usr/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: MCU G++ Compiler'
	@echo $(PWD)
	arm-none-eabi-g++ -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"C:/Users/Itama/OneDrive/Documents/GIT-PUBLISH/ROS_stm32f1_rosserial_USB_VCP/Inc" -I"C:/Users/Itama/OneDrive/Documents/GIT-PUBLISH/ROS_stm32f1_rosserial_USB_VCP/Drivers/STM32F1xx_HAL_Driver/Inc" -I"C:/Users/Itama/OneDrive/Documents/GIT-PUBLISH/ROS_stm32f1_rosserial_USB_VCP/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"C:/Users/Itama/OneDrive/Documents/GIT-PUBLISH/ROS_stm32f1_rosserial_USB_VCP/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"C:/Users/Itama/OneDrive/Documents/GIT-PUBLISH/ROS_stm32f1_rosserial_USB_VCP/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"C:/Users/Itama/OneDrive/Documents/GIT-PUBLISH/ROS_stm32f1_rosserial_USB_VCP/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"C:/Users/Itama/OneDrive/Documents/GIT-PUBLISH/ROS_stm32f1_rosserial_USB_VCP/Drivers/CMSIS/Include" -I"C:/Users/Itama/OneDrive/Documents/GIT-PUBLISH/ROS_stm32f1_rosserial_USB_VCP/ros_lib" -I"C:/Users/Itama/OneDrive/Documents/GIT-PUBLISH/ROS_stm32f1_rosserial_USB_VCP/usr"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fno-exceptions -fno-rtti -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


