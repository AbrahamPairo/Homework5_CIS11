NASM = nasm
GPP  = g++
NASMFLAGS = -f elf64 -g -F dwarf
CPPFLAGS  = -c -m64 -Wall -std=c++17

OBJECTS = largest.o input_array.o manager.o output_array.o find_largest.o

all: main

# Compile C++ sources
largest.o: largest.cpp
	$(GPP) $(CPPFLAGS) largest.cpp -o largest.o

input_array.o: input_array.cpp
	$(GPP) $(CPPFLAGS) input_array.cpp -o input_array.o

# Assemble ASM sources
manager.o: manager.asm
	$(NASM) $(NASMFLAGS) manager.asm -o manager.o

output_array.o: output_array.asm
	$(NASM) $(NASMFLAGS) output_array.asm -o output_array.o

find_largest.o: find_largest.asm
	$(NASM) $(NASMFLAGS) find_largest.asm -o find_largest.o

# Link all objects into executable 'main'
main: $(OBJECTS)
	$(GPP) -m64 -std=c++17 -o main $(OBJECTS)

# Run the program (if desired)
run: main
	./main

# Clean up build artifacts
clean:
	rm -f $(OBJECTS) main

