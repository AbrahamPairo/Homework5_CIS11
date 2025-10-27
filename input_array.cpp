#include <iostream>
#include <limits>

extern "C" long input_array(long* array, long max) {
    std::cout << "Input your integer data one line at a time and enter 'q' when finished" 
              << std::endl;
    long count = 0;
    while (count < max) {
        std::cout << "Enter the next integer: ";
        long value;
        if (!(std::cin >> value)) {
            // Non-integer input encountered (or EOF); assume user is done
            std::cin.clear();
            std::string dummy;
            std::getline(std::cin, dummy);       // discard the invalid input
            break;
        }
        array[count++] = value;
        std::cout << "You entered: " << value << std::endl;
        if (count < max) {
            std::cout << "You can enter up to " << (max - count) << " more integers" 
                      << std::endl;
        }
    }
    if (std::cin.fail()) {
        std::cout << "You have entered nonsense! Assuming you are done." << std::endl;
    }
    std::cout << "Total numbers entered: " << count << std::endl << std::endl;
    return count;
}

