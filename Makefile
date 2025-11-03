CXX=g++
CXXFLAGS=-std=c++17 -Wall -Wextra -O0 -fno-pie -no-pie
ASM=yasm
ASMFLAGS=-f elf64 -g dwarf2

.PHONY: build clean run

build: main

main: largest.o manager.o input_array.o output_array.o find_largest.o
	$(CXX) $(CXXFLAGS) -o main largest.o manager.o input_array.o output_array.o find_largest.o

largest.o: largest.cpp
	$(CXX) $(CXXFLAGS) -c largest.cpp -o largest.o

input_array.o: input_array.cpp
	$(CXX) $(CXXFLAGS) -c input_array.cpp -o input_array.o

manager.o: manager.asm
	$(ASM) $(ASMFLAGS) -o manager.o manager.asm

output_array.o: output_array.asm
	$(ASM) $(ASMFLAGS) -o output_array.o output_array.asm

find_largest.o: find_largest.asm
	$(ASM) $(ASMFLAGS) -o find_largest.o find_largest.asm

run: build
	./main

clean:
	rm -f *.o main

