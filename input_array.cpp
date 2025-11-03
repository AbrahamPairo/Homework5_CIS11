#include <iostream>
using std::cin; using std::cout; using std::endl;

extern "C" long input_array(long* data, long max) {
    long n{};
    cout << "Enter the number of ints: ";
    if (!(cin >> n) || n < 0) return 0;
    if (n > max) n = max;

    for (long i = 0; i < n; ++i) {
        cout << "Enter the next integer: ";
        long v{};
        while (!(cin >> v)) {
            cin.clear();
            cin.ignore(10000, '\n');
            cout << "Bad input, try again: ";
        }
        data[i] = v;     // will segfault only if 'data' wasn’t a real address
    }
    return n;
}

