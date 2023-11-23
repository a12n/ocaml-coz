OCaml interface to Coz causal profiler.

First, build everything with `-gdwarf-3`:

```
export CFLAGS=-gdwarf-3
opam switch create …
opam install …
dune build …
```
