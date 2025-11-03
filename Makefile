CXX=g++
CXXFLAGS=-std=c++17 -Wall -Wextra -O0 -fno-pie -no-pie
YASM=yasm
YFLAGS=-f elf64 -g dwarf2

OBJS=largest.o manager.o input_array.o output_array.o find_largest.o

build: $(OBJS)
	$(CXX) $(CXXFLAGS) -o main $(OBJS)

largest.o: largest.cpp
	$(CXX) $(CXXFLAGS) -c largest.cpp -o largest.o

manager.o: manager.asm
	$(YASM) $(YFLAGS) -o manager.o manager.asm

input_array.o: input_array.cpp
	$(CXX) $(CXXFLAGS) -c input_array.cpp -o input_array.o

output_array.o: output_array.asm
	$(YASM) $(YFLAGS) -o output_array.o output_array.asm

find_largest.o: find_largest.asm
	$(YASM) $(YFLAGS) -o find_largest.o find_largest.asm

clean:
	rm -f *.o main

