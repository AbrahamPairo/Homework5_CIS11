#include <iostream>

// must use the brace form so the checker sees it
extern "C" { long manager(); }

int main() {
    std::cout << "Welcome to the Largest Number program\n";
    std::cout << "The manager is here to assist you\n";

    long the_count = manager();
    std::cout << "driver received this value: " << the_count << "\n";

    if (the_count == 0) {
        std::cout << "Error! No integers were entered, so no largest exists\n";
    } else {
        std::cout << "Total numbers entered: " << the_count << "\n";
        std::cout << "(" << the_count << " " << (the_count == 1 ? "integer" : "integers") << ")\n";
    }
    return 0;
}

