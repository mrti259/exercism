#include "collatz_conjecture.h"

int steps(int number) {
    if (number < 1) return -1;
    
    int count = 0;
    while (number > 1) {
        count++;
        if (number % 2 == 0) {
            number = number / 2;
        } else {
            number = 3  * number + 1;
        }
    }
    return count;
}