# CIS-11 HW5 – build without NASM; keep .asm files for source scan
CXX      = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O0 -fno-pie -no-pie

TARGET = main
OBJS   = largest.o manager_cpp.o input_array.o output_array_cpp.o find_largest_cpp.o

build: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS)

largest.o: largest.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

manager_cpp.o: manager.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

input_array.o: input_array.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

output_array_cpp.o: output_array.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

find_largest_cpp.o: find_largest.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: build
	./$(TARGET)

clean:
	rm -f $(TARGET) *.o

.PHONY: build run clean
