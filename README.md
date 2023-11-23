OCaml interface to [Coz](https://github.com/plasma-umass/coz) causal profiler.

First, build everything (the base compiler and all programm
dependencies) with `-gdwarf-3`:

```
export CFLAGS=-gdwarf-3
opam switch create …
opam install …
dune build …
```

Build the `toy` example:

```
dune build ./example/toy.exe
```

Install `coz` in Debian or Ubuntu:

```
sudo apt-get install coz-profiler
```

Run the native binary with `coz` and plot the results:

```
coz run --- ./_build/default/example/toy.exe
coz plot
```
