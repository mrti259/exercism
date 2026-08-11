#include "two_fer.h"

const char *part1 = "One for ";
const char *part2 = "you"; 
const char *part3 = ", one for me."; 

void two_fer(char *buffer, const char *name) {
    unsigned int i=0, o=0;

    while(part1[i]) {
        buffer[o + i] = part1[i];
        i++;
    }
    
    o += i;
    i = 0;
    if (name) {
        while(name[i]) {
            buffer[o + i] = name[i];
            i++;
        }   
    } else {
        while(part2[i]) {
            buffer[o + i] = part2[i];
            i++;
        }   
    }

    o += i;
    i = 0;
    while(part3[i]) {
        buffer[o + i] = part3[i];
        i++;
    }

    buffer[o + i] = '\0';
        
}