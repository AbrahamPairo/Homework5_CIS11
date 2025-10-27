#include <iostream>
#include <string>

extern "C" long input_array(long* arr, long max) {
    std::cout << "Input your integer data one line at a time and enter 'q' when finished" << std::endl;

    long count = 0;
    bool endedOnNonsense = false;

    while (count < max) {
        std::cout << "Enter the next integer: ";
        std::cout.flush();

        long number;
        if (!(std::cin >> number)) {
            endedOnNonsense = true;
            if (!std::cin.eof()) {            // consumir token inválido (p. ej. 'q')
                std::cin.clear();
                std::string dummy;
                std::cin >> dummy;
            }
            break;
        }

        arr[count++] = number;
        std::cout << "You entered: " << number << std::endl;

        if (count < max) {
            std::cout << "You can enter up to " << (max - count) << " more integers" << std::endl;
        } else {
            break; // alcanzado límite
        }
    }

    if (endedOnNonsense) {
        std::cout << "You have entered nonsense! Assuming you are done." << std::endl;
    }
    std::cout << "Total numbers entered: " << count << std::endl;
    return count;
}
