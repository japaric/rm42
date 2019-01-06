MEMORY
{
  FLASH : ORIGIN = 0x00000000, LENGTH = 384K
  RAM : ORIGIN = 0x08000000, LENGTH = 32K
  EEPROM : ORIGIN = 0xF0200000, LENGTH = 16K
}

/* Initial stack pointer */
/* 48 is the size (in bytes) of the vector table in RAM */
__stack_top__ = ORIGIN(RAM) + LENGTH(RAM) - 48;

SECTIONS
{
  /* Bootloader */
  .vectors ORIGIN(FLASH) :
  {
    KEEP(*(.Vectors));
  } > FLASH

  .text : ALIGN(4)
  {
    *(.ResetTrampoline);
    *(.main);
    *(.text .text.*);
    . = ALIGN(4);
  } > RAM

  .rodata : ALIGN(4)
  {
    *(.rodata .rodata.*);
    . = ALIGN(4);
  } > RAM

  .data : ALIGN(4)
  {
    *(.data .data.*);
    . = ALIGN(4);
  } > RAM

  .bss : ALIGN(4)
  {
    *(.bss .bss.*);
    . = ALIGN(4);
  } > RAM

  .ram_vectors __stack_top__ :
  {
      KEEP(*(.RamVectors));
  } > RAM

  /* ## Discarded sections */
  /DISCARD/ :
  {
    /* Unused exception related info that only wastes space */
    *(.ARM.exidx.*);
  }
}

ENTRY(ResetTrampoline);
EXTERN(Vectors);

PROVIDE(Undefined = DefaultHandler);
PROVIDE(SVC = DefaultHandler);
PROVIDE(PrefetchAbort = DefaultHandler);
PROVIDE(DataAbort = DefaultHandler);
PROVIDE(FIQ = DefaultHandler);
PROVIDE(IRQ = DefaultHandler);
