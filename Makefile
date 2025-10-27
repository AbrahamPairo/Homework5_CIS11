# Makefile — CIS-11 HW5 "The Largest Number"
CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -O2 -fno-pie
LDFLAGS := -no-pie
NASM := nasm
NASMFLAGS := -f elf64

OBJS := largest.o manager.o input_array.o output_array.o find_largest.o

# Default: compila y enlaza (no corre)
all: main

# Enlace final -> ejecutable "main"
main: $(OBJS)
	$(CXX) -std=c++17 $(LDFLAGS) -o $@ $(OBJS)

# C++
largest.o: largest.cpp
	$(CXX) $(CXXFLAGS) -c $<

input_array.o: input_array.cpp
	$(CXX) $(CXXFLAGS) -c $<

# Assembly (NASM)
manager.o: manager.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

output_array.o: output_array.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

find_largest.o: find_largest.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

# Ejecutar
run: main
	./main

# Limpiar
clean:
	rm -f $(OBJS) main
