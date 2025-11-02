#include <cstdio>

extern "C" {
    long manager();
}

int main() {
    // Disable stdout buffering (ensures autograder captures all output)
    setvbuf(stdout, nullptr, _IONBF, 0);

    printf("Welcome to the Largest Number program, brought to you by Abraham Pairo.\n");

    long the_count = manager();

    printf("The driver received this value: %ld\n", the_count);
    printf("Have a nice day. The program will return control to the operating system.\n");

    return 0;
}

