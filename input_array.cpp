#include <iostream>
#include <string>
#include <limits>
using namespace std;

// expose the signature unmangled
extern "C" {
    long input_array(long* a, long max_n);
}

// read integers until nonsense (like 'q') or we hit max_n
extern "C" long input_array(long* a, long max_n) {
    long n = 0;

    while (n < max_n) {
        cout << "Enter the next integer:";   // <-- exact text
        long x;
        cin >> x;

        if (cin.fail()) {
            // consume the bad token (e.g., 'q') and complain exactly once
            cin.clear();
            string junk;
            cin >> junk;
            cout << "You have entered nonsense. Assuming you are done\n";
            break;
        }

        a[n++] = x;

        // echo each value and remaining capacity
        cout << "You entered: " << x << "\n";
        cout << "You can enter up to " << (max_n - n) << " more integers\n";
    }
    return n;  // number successfully read
}


