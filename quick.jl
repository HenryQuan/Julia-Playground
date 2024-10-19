
# function quicksort(arr)
#     if length(arr) <= 1
#         return arr
#     end

#     pivot = arr[end]  # Choose the last element as the pivot
#     left = [x for x in arr if x < pivot]
#     middle = [x for x in arr if x == pivot]
#     right = [x for x in arr if x > pivot]

#     return vcat(quicksort(left), middle, quicksort(right))
# end


function quicksort(arr)
    if length(arr) <= 1
        return arr
    end
    pivot = arr[1]
    left = [x for x in arr[2:end] if x <= pivot]
    right = [x for x in arr[2:end] if x > pivot]
    return vcat(quicksort(left), [pivot], quicksort(right))
end

function quicksort_test()
    result = []
    for i in 1:10000
        sorted_arr = quicksort(rand(1000))
        if i == 10000
            result = sorted_arr
        end
    end
    return result
end