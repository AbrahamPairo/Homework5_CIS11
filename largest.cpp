// largest.cpp
#include <iostream>

extern "C" long manager();

int main() {
    long the_count = manager();
    std::cout << "Count returned: " << the_count << "\n";
    return 0;
}

