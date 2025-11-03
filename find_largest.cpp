extern "C" long find_largest(const long* a, long n) {
    if (n <= 0) return -1;
    long idx = 0;
    long mx  = a[0];
    for (long i = 1; i < n; ++i) {
        if (a[i] > mx) { mx = a[i]; idx = i; }
    }
    return idx;
}

