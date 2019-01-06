#![feature(core_intrinsics)]
#![no_main]
#![no_std]

extern crate panic_halt;

use core::intrinsics;

#[rt::entry]
unsafe fn main() -> ! {
    intrinsics::abort();
}

#[rt::exception]
fn Undefined() -> ! {
    loop {}
}
