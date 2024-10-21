
# call the main function from libquick.so

function benchmark_c_quick_sort()
    start_time = time()
    @ccall "libquick.so".main()::Cvoid
    println("Julia @ccall time: ", time() - start_time)
end

if abspath(PROGRAM_FILE) == @__FILE__
    benchmark_c_quick_sort()
end
