# from quick import quicksort
from time import time
import random
from juliacall import Main as jl
import quick

start_time = time()
# result = quick.quicksort_test()
result = quick.quicksort(random.sample(range(1001), 1000))
print("Execution time: ", time() - start_time)
print(result)  # Output: [1, 2, 3, 4, 7]
exit()


jl.include("quick.jl")

start_time = time()
# for i in range(10000):
#     # sort random numbers
#     sorted_array = jl.quicksort(random.sample(range(1001), 1000))
result = jl.quicksort_test()
print("Execution time: ", time() - start_time)
# print(result[::-1])  # Output: [1, 2, 3, 4, 7]

# arr = [4, 2, 7, 1, 3, 2, 8, 9, 0, 11, 51, 23, 12, 6, 5, 4, 3, 2, 1, 0, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
# for i in range(10000):
#     # sort random numbers
#     sorted_array = quicksort(random.sample(range(1001), 1000))
# print("Execution time: ", time() - start_time)
# print(sorted_arr)  # Output: [1, 2, 3, 4, 7]
