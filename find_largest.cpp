extern "C" {
    long find_largest(long* a, long n) {
        if (n <= 0) return 0;
        long idx = 0, best = a[0];
        for (long i = 1; i < n; ++i) {
            if (a[i] > best) { best = a[i]; idx = i; }
        }
        return idx;
    }
}

