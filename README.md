# Julia Playground

The main goal is using Julia with Python, and see how well it works. Also, I compare the performance with Python and Nim. The result is quite interesting. Julia is a bit slower than Nim probably due to the JIT compilation. However, it is much faster than Python. I can load my Julia code in Python, and it works well like Nim's exportpy.

Julia can also use many other languages, here, I only tried some quick C. The experience is shockingly good, just use `@ccall` and it works. It also has no class/interface, but it can use struct and function similar to Rust and C? Good and bad I guess.

Overall, this is a nice language to use side by side with Python. Nim can also be another one to look into, so I will keep an eye on both. Mojo is probably a better one, but it doesn't run on Windows yet. Next time, I may try a bit more on Bun/Zig vs Deno/Rust.

Also see the [HaxeExperiment](https://github.com/HenryQuan/HaxeExperiment).

## Benchmark

Simply run the `allinone.py` to see the result. Some setup is required, make sure all the dependencies are installed.

```powershell
python -m venv .env
.env\Scripts\activate
pip install -r requirements.txt

nim c -d:release --app:lib --out:quicknim.pyd --threads:on --tlsEmulation:off --passL:-static quicknim
gcc -o1 -fPIC -shared -o libquick.so quick.c

python allinone.py
```

You will see the result like this:

```
Benchmark everything in one file
Nim pyd time:  2.429507255554199
Julia in python time:  2.5180130004882812
C: Time taken: 0.904000
Julia @ccall time: 0.9040000438690186
juliacall time:  0.9393115043640137
Notice the overhead with @ccall in Julia and also juliacall in python

Now, let's wait for last benchmark with pure python
Python time:  11.553006410598755
```

## Conclusion

As you can see, Nim is faster than Julia by 0.1s, but Julia in my experience could be a bit easier compared to Nim. I need to put a big question mark here though, but they are far better than Python which ever you choose. C implementation is definitely the fastest, but it is not as easy as Nim or Julia, the source code is also much longer.

See closely, the overhead with `@ccall` is extremely small, so using C with Julia is quite nice. However, the overhead with `juliacall` is around 0.04s. Even if we add double overhead, it is still far ahead of the Python's legendary 11.55s, with optimisation it can go down to 7.75s, still more than 3 times slower. Remember that `juliacall` also converts the data into Python types, and Nim's `exportpy` does the same. You can use Python in Nim & Julia and also use Nim & Julia in Python, so it is quite flexible here.

Using Nim or Julia side by side with Python is definitely a great choice, not to mention that I have to do quite some data processing in Python, using Julia's built-in `DataFrames` could give a significant boost in performance especially when I deal with stock data with over 500 files each having 10,000 rows and more. In total, I will have over 3000 files and there can only be more in the future.
