def quicksort(arr):
    if len(arr) <= 1:
        return arr

    pivot = arr[-1]  # Choose the last element as the pivot
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]

    return quicksort(left) + middle + quicksort(right)
