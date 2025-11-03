#include <iostream>
#include <limits>
#include <string>
using std::cin; using std::cout; using std::string;

extern "C" long input_array(long* a, long max) {
    cout << "Input your integer data one line at a time and enter 'q' when finished\n";
    long n = 0;
    while (n < max) {
        cout << "Enter the next integer: ";
        long x;
        if (cin >> x) {
            cout << "You entered: " << x << "\n";
            a[n++] = x;
            cout << "You can enter up to " << (max - n) << " more integers\n";
        } else {
            cin.clear();
            string junk;
            cin >> junk;
            cout << "You have entered nonsense! Assuming you are done.\n";
            break;
        }
    }
    cout << "Total numbers entered: " << n << "\n";
    return n;
}

