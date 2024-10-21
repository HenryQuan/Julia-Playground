# def quicksort(arr):
#     if len(arr) <= 1:
#         return arr

#     pivot = arr[-1]  # Choose the last element as the pivot
#     left = [x for x in arr if x < pivot]
#     middle = [x for x in arr if x == pivot]
#     right = [x for x in arr if x > pivot]

#     return quicksort(left) + middle + quicksort(right)

# optimized by copilot from 11.55 to 7.77
def quicksort(arr):
    def _quicksort(arr, low, high):
        if low < high:
            p = partition(arr, low, high)
            _quicksort(arr, low, p)
            _quicksort(arr, p + 1, high)

    def partition(arr, low, high):
        pivot = arr[low + (high - low) // 2]
        while True:
            while arr[low] < pivot:
                low += 1
            while arr[high] > pivot:
                high -= 1
            if low >= high:
                return high
            arr[low], arr[high] = arr[high], arr[low]
            low += 1
            high -= 1

    _quicksort(arr, 0, len(arr) - 1)
    return arr
