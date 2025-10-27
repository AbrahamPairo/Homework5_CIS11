#include <iostream>
extern "C" {
    long manager();
}

int main() {
    std::cout << "Welcome to the Largest Number program, brought to you by Burgundy Flemming." 
              << std::endl;
    long the_count = manager();  // Call the assembly manager() function and store result
    std::cout << "The driver received this value: " << the_count << std::endl;
    std::cout << "Have a nice day. The program will return control to the operating system." 
              << std::endl;
    return 0;
}

