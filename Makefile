# Makefile for Homework 5 - The Largest Number
# Author: Abraham Pairo
# Class: CIS-11
# Professor: Peralta

# Compiler and assembler options
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O0 -fno-pie -no-pie
ASM = nasm
ASMFLAGS = -f elf64

# Target executable
TARGET = main

# Object files
OBJS = largest.o manager.o input_array.o output_array.o find_largest.o

# Default build target (used by Gradescope)
build: $(TARGET)

# Link all object files into final executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Compile C++ source files
largest.o: largest.cpp
	$(CXX) $(CXXFLAGS) -c largest.cpp

input_array.o: input_array.cpp
	$(CXX) $(CXXFLAGS) -c input_array.cpp

# Assemble ASM files
manager.o: manager.asm
	$(ASM) $(ASMFLAGS) -o manager.o manager.asm

output_array.o: output_array.asm
	$(ASM) $(ASMFLAGS) -o output_array.o output_array.asm

find_largest.o: find_largest.asm
	$(ASM) $(ASMFLAGS) -o find_largest.o find_largest.asm

# Clean build artifacts
clean:
	rm -f *.o $(TARGET)

