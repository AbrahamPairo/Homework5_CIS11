#include <iostream>
#include <string>
#include <limits>
using namespace std;

extern "C" {
    long input_array(long* a, long max_n);
}

extern "C" long input_array(long* a, long max_n) {
    long n = 0;
    while (n < max_n) {
        cout << "Enter the next integer:";   // exact text
        long x;
        cin >> x;

        if (cin.fail()) {
            cin.clear();
            string junk;
            cin >> junk;
            cout << "You have entered nonsense. Assuming you are done\n";
            break;
        }

        a[n++] = x;
        cout << "You entered: " << x << "\n";
        cout << "You can enter up to " << (max_n - n) << " more integers\n";
    }
    return n;
}

