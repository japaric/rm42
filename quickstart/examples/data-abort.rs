#![no_main]
#![no_std]

extern crate panic_halt;

use core::ptr;

#[rt::entry]
unsafe fn main() -> ! {
    ptr::read_volatile(0x0800_8000 as *const u32);

    loop {}
}

#[rt::exception]
fn DataAbort() -> ! {
    loop {}
}
