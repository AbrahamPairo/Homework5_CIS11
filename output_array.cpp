#include <cstdio>

extern "C" {
    void output_array(long* a, long n) {
        std::printf("The following integers were received: ");
        if (n == 1) std::printf("(%ld integer) ", n);
        else        std::printf("(%ld integers) ", n);

        for (long i = 0; i < n; ++i) {
            std::printf("%ld", a[i]);
            if (i + 1 < n) std::printf(", ");
        }
        std::printf("\n");
    }
}

