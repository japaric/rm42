target extended-remote :3333

# detect unhandled exceptions, hard faults and panics
break DefaultHandler

# the processor can't be `halt`-ed so we put a breakpoint to halt it after loading the program
break ResetTrampoline

# *try* to stop at the user entry point (it might be gone due to inlining)
break main

# disable semihosting as it makes the processor halt whenever SVC is used
monitor arm semihosting disable

load
