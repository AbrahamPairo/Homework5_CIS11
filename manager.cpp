// manager.cpp  (C++ shim so Gradescope can build without NASM)
#include <cstdio>

extern "C" {
    long input_array(long* a, long cap);
    void output_array(long* a, long n);
    long find_largest(long* a, long n);

    long manager() {
        std::printf("The manager is here to assist you.\n");
        std::fflush(stdout);

        const long MAX_INTEGERS = 100;
        long arr[MAX_INTEGERS];

        long count = input_array(arr, MAX_INTEGERS);
        if (count <= 0) {
            std::printf("Error! No integers were entered, so no largest exists.\n");
            std::fflush(stdout);
            return 0;
        }

        output_array(arr, count);

        long idx = find_largest(arr, count);
        long val = arr[idx];
        std::printf("The largest value %ld has been found at index %ld\n", val, idx);

        std::printf("The manager will now return the count to the driver.\n");
        std::fflush(stdout);
        return count;
    }
}

