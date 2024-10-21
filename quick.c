/**
 * Quick sort implementation in C
 * Compile with:
 * gcc -o2 -o quick quick.c; ./quick 3 1 4 1 5 9 2 6 5 3 5
 */

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

void quick_sort_mut(int* list, int count);

static int is_number(const char* input);

int main(int argc, char* argv[]) {
    if (argc < 2) {
        const char* program_name = argv[0];
        printf("Usage: %s <number1> <number2> ... <numberN>\n", program_name);
        return 1;
    }

    int count = argc - 1;
    int* list = (int*)malloc(count * sizeof(int));
    if (list == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    for (int i = 0; i < count; i++) {
        // make sure inputs are integers
        if (!is_number(argv[i + 1])) {
            printf("Invalid input: %s\n", argv[i + 1]);
            return 1;
        }

        list[i] = atoi(argv[i + 1]);
    }

    quick_sort_mut(list, count);

    printf("Sorted list: ");
    for (int i = 0; i < count; i++) {
        printf("%d ", list[i]);
    }

    return 0;
}

static int is_number(const char* input) {
    for (int i = 0; input[i] != '\0'; i++) {
        if (!isdigit(input[i])) {
            return 0;
        }
    }
    return 1;
}

void quick_sort_mut(int* list, int count) {
    if (count <= 1) {
        return;
    }
    int pivot = list[0];

    int* left = (int*)malloc(count * sizeof(int));
    int* right = (int*)malloc(count * sizeof(int));

    int left_count = 0;
    int right_count = 0;

    for (int i = 1; i < count; i++) {
        if (list[i] < pivot) {
            left[left_count++] = list[i];
        } else {
            right[right_count++] = list[i];
        }
    }

    quick_sort_mut(left, left_count);
    quick_sort_mut(right, right_count);

    for (int i = 0; i < left_count; i++) {
        list[i] = left[i];
    }
    list[left_count] = pivot;
    for (int i = 0; i < right_count; i++) {
        list[left_count + 1 + i] = right[i];
    }

    free(left);
    free(right);
}
