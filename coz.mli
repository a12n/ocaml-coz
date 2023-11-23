(** The module provides functions to call Coz (causal profiler for
    native code) instrumentation macros from OCaml. *)

type counter = private nativeint

val throughput : string -> counter
(** "To profile throughput you must indicate a line in the code that
    corresponds to the end of a unit of work". *)

val latency : string -> counter * counter
(** "To profile latency, you must place two progress points that
    correspond to the start and end of an event of interest". *)

external incr : (counter[@unboxed]) -> unit
  = "caml_coz_byte_incr" "caml_coz_incr"
[@@noalloc]
(** Increment Coz profiling counter. *)
