
# call the main function from libquick.so

start_time = time()
@ccall "libquick.so".main()::Cvoid
println("Execution time: ", time() - start_time)
