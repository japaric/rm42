#![no_std]

#[cfg(not(debug_assertions))]
use core::sync::atomic::{self, Ordering};

pub use rt_macros::{entry, exception};

pub enum Exception {
    DefaultHandler,

    Undefined,
    SVC,
    PrefetchAbort,
    DataAbort,
    // IRQ,
    FIQ,
}

#[allow(non_snake_case)]
#[no_mangle]
fn DefaultHandler() {
    loop {
        #[cfg(not(debug_assertions))]
        atomic::compiler_fence(Ordering::SeqCst);
    }
}
