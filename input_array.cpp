#include <cstdio>
#include <iostream>
#include <string>
using namespace std;

extern "C" {
    long input_array(long* arr, long max);
}

extern "C" long input_array(long* arr, long max) {
    // Disable stdout buffering for consistent autograder capture
    setvbuf(stdout, nullptr, _IONBF, 0);

    long count = 0;
    long value;

    printf("Input your integer data one line at a time and enter 'q' when finished\n");

    while (count < max) {
        printf("Enter the next integer: ");
        if (!(cin >> value)) break;

        arr[count] = value;
        printf("You entered: %ld\n", value);
        printf("You can enter up to %ld more integers\n", max - count - 1);
        count++;
    }

    if (cin.fail()) {
        cin.clear();
        string junk;
        cin >> junk;
        printf("You have entered nonsense! Assuming you are done.\n");
    }

    printf("Total numbers entered: %ld\n", count);
    return count;
}

