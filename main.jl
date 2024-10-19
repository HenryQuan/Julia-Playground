include("quick.jl")
import Random

start_time = time()
# arr = [4, 2, 7, 1, 3, 2, 8, 9, 0, 11, 51, 23, 12, 6, 5, 4, 3, 2, 1, 0, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
# sorted_arr = []
for i in 1:10000
    sorted_arr = quicksort(rand(1000))
end

println("Execution time: ", time() - start_time)
# println(sorted_arr)  # Output: [1, 2, 3, 4, 7]
