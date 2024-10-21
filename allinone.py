from time import time

print("Benchmark everything in one file")

# benchmark nim in python
from quicknim import quicksort_test

start_time = time()
result = quicksort_test()
print("Nim pyd time: ", time() - start_time)

# benchmark julia in python
from juliacall import Main as jl

jl.include("quick.jl")

start_time = time()
result = jl.quicksort_test()
print("Julia in python time: ", time() - start_time)

# benchmark c from julia in python
jl.include("quick_benchmark.jl")

start_time = time()
jl.benchmark_c_quick_sort()
print("juliacall time: ", time() - start_time)
print("Notice the overhead with @ccall in Julia and also juliacall in python")

print("\nNow, let's wait for last benchmark with pure python")

# benchmark pure python
from quick import quicksort
import random

for i in range(10000):
    # sort random numbers
    sorted_array = quicksort(random.sample(range(1001), 1000))
print("Python time: ", time() - start_time)
