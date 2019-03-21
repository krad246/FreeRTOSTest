# ------------------------------------------------------------------
# Paths to important kernel headers
FREERTOS = /mnt/c/FreeRTOSv10.2.0/FreeRTOS/Source/include
ARMCM3 = /mnt/c/FreeRTOSv10.2.0/FreeRTOS/Source/portable/GCC/ARM_CM3
CONFIG = .
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# Command line arguments for include
INCLUDE_LST = $(FREERTOS) $(ARMCM3) $(CONFIG)
INCLUDES = $(foreach i, $(INCLUDE_LST), -I$i)
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# Specify the compilers to use
CC := arm-none-eabi-gcc
CXX := arm-none-eabi-g++
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# Flags for the C compiler
CFLAGS = -Wall -O3 $(ARCHFLAGS) $(INCLUDES) \
	-ffreestanding -fno-common -fomit-frame-pointer \
	-ffunction-sections -fdata-sections 
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# Architecture-specific flags
ARCHFLAGS = -mcpu=cortex-m4 -mthumb
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# Linker flags
LDFLAGS = --specs=nosys.specs -Wl,--gc-sections
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# What we want to build into an application
# Get the C sources and turn everything into an object file
SRC = $(wildcard *.c)
OBJS = $(SRC:.c=.o)
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# Compile the files into an .elf executable
app: $(OBJS)
	arm-none-eabi-gcc $(LDFLAGS) -o app $(OBJS)
	rm -f *.o
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# Specifies how to clean directory
clean:
	rm -f *.o app
# ------------------------------------------------------------------