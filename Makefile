# build with C++ shims (no NASM required)
CXX      = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O0 -fno-pie -no-pie

OBJS = largest.o manager_cpp.o input_array.o output_array_cpp.o find_largest_cpp.o

all: main
build: main

main: $(OBJS)
	$(CXX) $(CXXFLAGS) -o main $(OBJS)

largest.o: largest.cpp
	$(CXX) $(CXXFLAGS) -c largest.cpp -o largest.o

manager_cpp.o: manager.cpp
	$(CXX) $(CXXFLAGS) -c manager.cpp -o manager_cpp.o

input_array.o: input_array.cpp
	$(CXX) $(CXXFLAGS) -c input_array.cpp -o input_array.o

output_array_cpp.o: output_array.cpp
	$(CXX) $(CXXFLAGS) -c output_array.cpp -o output_array_cpp.o

find_largest_cpp.o: find_largest.cpp
	$(CXX) $(CXXFLAGS) -c find_largest.cpp -o find_largest_cpp.o

clean:
	rm -f *.o main

