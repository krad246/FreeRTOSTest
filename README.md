# Purpose
To try to get a Makefile build of FreeRTOS up and running. See the example files in the repository.

# Steps
- Download the FreeRTOS zip file
- Identify the architecture you are building for.
- Add list.c, heap_x.c, port.c, queue.c, tasks.c, and FreeRTOSConfig.h to the project directory
- Create a Makefile

# Makefile
- Include paths to the kernel headers
- Include paths to the specific port of FreeRTOS
- FreeRTOSConfig.h
- Architecture-specific compiler flags, such as:
	```
	ARCHFLAGS = -mcpu=cortex-m4 -mthumb
	```
- Linker flags and a linker script, i.e.:
	```
	LINKER_SCRIPT = xxx.ld
	LDFLAGS = -T$(LINKER_SCRIPT) -nostartfiles -Wl, --gc-sections
	```
- Recipes to build a .elf file, i.e.:
	```
	SRC = $(wildcard *.c)
	OBJS = $(SRC:.c=.o)
	app: $(OBJS)
		arm-none-eabi-gcc $(LDFLAGS) -o app $(OBJS)
		rm *.o
	```