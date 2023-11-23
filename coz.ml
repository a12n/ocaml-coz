type counter = nativeint (* Outside the heap pointer to coz_counter_t struct. *)

external get_counter : (int[@untagged]) -> string -> (counter[@unboxed])
  = "caml_coz_byte_get_counter" "caml_coz_get_counter"

let throughput name = get_counter 1 name
let latency name = (get_counter 2 name, get_counter 3 name)

external incr : (counter[@unboxed]) -> unit
  = "caml_coz_byte_incr" "caml_coz_incr"
[@@noalloc]
