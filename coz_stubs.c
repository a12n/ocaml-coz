#include <coz.h>

#include <caml/alloc.h>
#include <caml/camlatomic.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>

CAMLprim value caml_coz_get_counter(intnat type, value name)
{
    /* TODO: As tagged integer. */
    CAMLparam1(name);
    CAMLreturn(caml_copy_nativeint((intnat)_call_coz_get_counter((int)type, String_val(name))));
}

CAMLprim value caml_coz_incr(intnat counter)
{
    coz_counter_t* ptr = (coz_counter_t*)counter;
    if (ptr) {
        atomic_fetch_add_explicit(&ptr->count, 1, memory_order_relaxed);
    }
    return Val_unit;
}

CAMLprim value caml_coz_byte_get_counter(value type, value name)
{
    CAMLparam2(type, name);
    /* TODO: Is CAMLreturn still needed here? */
    CAMLreturn(caml_coz_get_counter((intnat)Int_val(type), name));
}

CAMLprim value caml_coz_byte_incr(value counter)
{
    return caml_coz_incr(Nativeint_val(counter));
}
