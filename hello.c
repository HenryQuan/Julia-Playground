#include <stdio.h>
#include <stdlib.h>

typedef struct Complicated {
    int x;
    int y;
    char* name;
} complicated;

// gcc -fPIC -shared -o hello.so hello.c
int say_y(int y) {
    printf("Hello from C: got y = %d.\n", y);
    return y;
}

complicated* get_complicated() {
    complicated* c = malloc(sizeof(complicated));
    c->x = 1;
    c->y = 2;
    c->name = "complicated";
    return c;
}

void free_complicated(complicated* c) {
    free(c);
    free(c->name);
    printf("freed\n");
}
