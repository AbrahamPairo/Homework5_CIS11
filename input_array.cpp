#include <iostream>
#include <string>

extern "C" long input_array(long* a, long max) {
    long n = 0;
    while (n < max) {
        std::cout << "Enter the next integer: ";
        long x;
        if (!(std::cin >> x)) {
            std::cin.clear();
            std::string trash;
            std::cin >> trash; // consume the 'q' (or other non-number)
            std::cout << "You have entered nonsense! Assuming you are done.\n";
            break;
        }
        a[n++] = x;
        std::cout << "You entered: " << x << "\n";
        std::cout << "You can enter up to " << (max - n) << " more integers\n";
    }
    std::cout << "Total numbers entered: " << n << "\n";
    return n;
}

