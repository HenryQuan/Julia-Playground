import random, times
import nimpy

proc quicksort(arr: seq[int]): seq[int] {.exportpy.}  =
    if arr.len <= 1:
        return arr
    let pivot = arr[arr.high div 2]
    var left, middle, right: seq[int]
    for x in arr:
        if x < pivot:
            left.add(x)
        elif x == pivot:
            middle.add(x)
        else:
            right.add(x)
    return quicksort(left) & middle & quicksort(right)

proc generateRandomSeq(n: int): seq[int] =
    randomize()
    result = newSeq[int](n)
    for i in 0..<n:
        result[i] = rand(1000)

proc quicksort_test(): seq[int] {.exportpy.} =
    var result: seq[int]
    for i in 1..10000:
        let sorted_arr = quicksort(generateRandomSeq(1000))
        if i == 10000:
            result = sorted_arr
    return result


# # Example usage
let time = epochTime()
let sorted_result = quicksort_test()
echo "Elapsed time: ", epochTime() - time
# echo sorted_result

# nim c -d:release --app:lib --out:quicknim.pyd --threads:on --tlsEmulation:off --passL:-static quicknim
# nim c -d:release .\quicknim.nim
