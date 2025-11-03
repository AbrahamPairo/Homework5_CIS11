#include <iostream>
using std::cout;

extern "C" void output_array(long* a, long n) {
    cout << "(" << n << " integers) ";
    for (long i = 0; i < n; ++i) {
        if (i) cout << ", ";
        cout << a[i];
    }
    cout << "\n";
}

