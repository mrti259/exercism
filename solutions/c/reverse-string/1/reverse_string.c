#include "reverse_string.h"
#include<stdlib.h>

static void copy(const char *v, char *s) {
    unsigned int i = 0;
    while(v[i]) {
        s[i] = v[i];
        i++;
    }
    s[i] = v[i];
}

static void rev(char *s, unsigned int top) {
    unsigned int i = 0;
    unsigned int j = top;
    j = j - 1;
    
    while(i < top/2) {
        char tmp = s[i];
        s[i] = s[j];
        s[j] = tmp;
        i++;
        j--;
    }
}

char *reverse(const char *value) {
    unsigned int len = 0;
    while (value[len]) len++;
    char *s = malloc(len);
    copy(value, s);
    rev(s, len);
    return s;
}