# `quickstart`

## Flash the bootloader (once)

``` console
$ cargo build
```

Then flash the ELF file `../target/armv7r-none-eabi/debug/quickstart` using
[UNIFLASH].

[UNIFLASH]: http://www.ti.com/tool/UNIFLASH

``` console
$ /opt/ti/uniflash/node-webkit/nw

$ # pick "LAUNCHXL-RM42 (LaunchPad)" as the device

$ # pick `quickstart` as the Flash image and uncheck "Binary"

$ # click "Load Image"; make sure OpenOCD is not running
```

## Loading programs

``` console
$ # on one terminal
$ openocd
```

``` console
$ # on another terminal
$ cargo run --example undefined

(gdb) b Undefined
(gdb) continue
```
