(** A program similar to [toy.cpp] example in Coz profiler source code. *)

let x = ref 0
let y = ref 0

let a () =
  x := 0;
  while !x < 2000000000 do
    ignore (Sys.opaque_identity x);
    incr x
  done

let b () =
  y := 0;
  let rec loop () =
    if !y < 1900000000 then (
      ignore (Sys.opaque_identity y);
      incr y;
      loop ())
  in
  loop ()

let () =
  let c = Coz.throughput "toy" in
  for i = 1 to 100 do
    Printf.eprintf "%d\n%!" i;
    let d1 = Domain.spawn a in
    let d2 = Domain.spawn b in
    Domain.join d1;
    Domain.join d2;
    Coz.incr c
  done
