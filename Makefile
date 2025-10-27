# Makefile for 'The Largest Number' assignment
ASM_SOURCES = manager.asm output_array.asm find_largest.asm
CPP_SOURCES = largest.cpp input_array.cpp
ASM_OBJECTS = $(ASM_SOURCES:.asm=.o)
CPP_OBJECTS = $(CPP_SOURCES:.cpp=.o)
OBJECTS     = $(ASM_OBJECTS) $(CPP_OBJECTS)
CXXFLAGS    = -std=c++17
ASFLAGS     = -f elf64

# Default target: compile and link the program into 'main'
all: main

# Build target (alias for the default target)
build: main

# Link all object files to produce the executable
main: $(OBJECTS)
	@g++ -std=c++17 -no-pie -o main $(OBJECTS)

# Compile C++ source files into object files
%.o: %.cpp
	@g++ -std=c++17 -c $< -o $@

# Assemble assembly source files into object files
%.o: %.asm
	@nasm -f elf64 $< -o $@

# Run the program (for convenience in local testing)
run: main
	@./main

# Clean up compiled objects and the executable
clean:
	@rm -f $(OBJECTS) main

