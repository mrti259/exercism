#include "square_root.h"

unsigned int square_root(unsigned int radicand) {
    unsigned int x = radicand;
    while ((x * x) - radicand)
        x = (x + radicand / x) / 2;
    return x;
}