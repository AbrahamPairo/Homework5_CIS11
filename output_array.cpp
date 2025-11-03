#include <iostream>

extern "C" long output_array(const long* a, long n) {
    std::cout << "The following integers were received:\n";
    std::cout << "(" << n << " integers) ";
    for (long i = 0; i < n; ++i) {
        std::cout << a[i];
        if (i + 1 < n) std::cout << ", ";
    }
    std::cout << "\n";
    return n;
}

