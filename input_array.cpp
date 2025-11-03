extern "C" long input_array(long*, long);  // prototype for grader

extern "C" {
    #include <iostream>
    #include <string>

    long input_array(long* a, long cap) {
        long count = 0;
        while (count < cap) {
            std::cout << "Enter the next integer: ";
            long x;
            if (!(std::cin >> x)) {
                std::cin.clear();
                std::string junk;
                std::getline(std::cin, junk);
                std::cout << "You have entered nonsense! Assuming you are done." << std::endl;
                break;
            }
            a[count++] = x;
        }
        std::cout << "Total numbers entered: " << count << std::endl;
        return count;
    }
}

