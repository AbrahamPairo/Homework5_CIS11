#include <iostream>

extern "C" { long manager(); }

int main() {
    long the_count = manager();
    std::cout << "The driver received this value: " << the_count << "\n";
    std::cout << "Have a nice day. The program will return control to the operating system.\n";
    return 0;
}

