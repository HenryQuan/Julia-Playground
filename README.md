# Julia Playground

The main goal is using Julia with Python, and see how well it works. Also, I compare the performance with Python and Nim. The result is quite interesting. Julia is a bit slower than Nim probably due to the JIT compilation. However, it is much faster than Python. I can load my Julia code in Python, and it works well like Nim's exportpy.

Julia can also use many other languages, here, I only tried some quick C. The experience is shockingly good, just use `@ccall` and it works. It also has no class/interface, but it can use struct and function similar to Rust and C? Good and bad I guess.

Overall, this is a nice language to use side by side with Python. Nim can also be another one to look into, so I will keep an eye on both. Mojo is probably a better one, but it doesn't run on Windows yet. Next time, I may try a bit more on Bun/Zig vs Deno/Rust.

Also see the [HaxeExperiment](https://github.com/HenryQuan/HaxeExperiment).
