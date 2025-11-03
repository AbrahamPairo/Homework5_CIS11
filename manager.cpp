#include <iostream>
using std::cout;

extern "C" long  input_array(long* a, long max);
extern "C" void  output_array(long* a, long n);
extern "C" long  find_largest(const long* a, long n);

extern "C" long manager() {
    const long MAX_INTEGERS = 100;
    static long arr[MAX_INTEGERS];

    long count = input_array(arr, MAX_INTEGERS);

    cout << "The following integers were received:\n";
    output_array(arr, count);

    long idx = find_largest(arr, count);
    if (idx >= 0) {
        cout << "The largest value " << arr[idx] << " has been found at index " << idx << "\n";
    } else {
        cout << "No data was received.\n";
    }

    cout << "The manager will now return the count to the driver.\n";
    return count;
}
