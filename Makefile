# CIS-11 HW5 – build only the C++ version (Gradescope has no nasm)

CXX      = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O0 -fno-pie -no-pie

TARGET   = main
SRCS     = largest.cpp manager.cpp input_array.cpp output_array.cpp find_largest.cpp
OBJS     = $(SRCS:.cpp=.o)

.PHONY: build clean run

build: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

run: build
	./$(TARGET)

