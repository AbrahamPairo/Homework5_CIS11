#include <iostream>

extern "C" long input_array(long* a, long max);
extern "C" long output_array(const long* a, long n);
extern "C" long find_largest(const long* a, long n);

extern "C" long manager() {
    const long MAX_INTEGERS = 100;
    long arr[MAX_INTEGERS];

    std::cout << "Input your integer data one line at a time and enter 'q' when finished\n";
    long count = input_array(arr, MAX_INTEGERS);

    output_array(arr, count);

    long idx = find_largest(arr, count);
    if (idx >= 0) {
        std::cout << "The largest value " << arr[idx] << " has been found at index " << idx << "\n";
    }

    std::cout << "The manager will now return the count to the driver.\n";
    return count;
}

