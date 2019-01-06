#![no_main]
#![no_std]

extern crate panic_halt;

use core::sync::atomic::{self, Ordering};

#[rt::entry]
fn main() -> ! {
    loop {
        // TODO
        atomic::compiler_fence(Ordering::SeqCst);
    }
}
