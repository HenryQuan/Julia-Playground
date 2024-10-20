result = @ccall "hello.so".say_y(5::Cint)::Cint
println(result)

struct Complicated
    a::Cint
    b::Cint
    c::Cstring
end

# get the struct
struct_from_c = @ccall "hello.so".get_complicated()::Ptr{Complicated}
println(struct_from_c)
reference = unsafe_load(struct_from_c)
println(reference)
println(reference.a)
println(reference.b)
# print out the string
println(unsafe_string(reference.c))
@ccall "hello.so".free_complicated(struct_from_c::Ptr{Complicated})::Cvoid

# this is copied
println(reference)
# emm, this is a problem, it should be freed already, so use after free
println(unsafe_string(reference.c))
