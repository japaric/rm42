# `rt`

> Like `cortex-m-rt` but tailored for the RM42L432

In particular, this `rt` will place all the program (.text, .rodata, .vectors)
in RAM (see SPNA236 for more details). The motivation for this unusual choice is
that OpenOCD doesn't support flashing this device and TI's flash tool is
painfully slow.

For all this to work a minimal bootloader must be first loaded on Flash. See the
`quickstart` directory for flashing instructions.
