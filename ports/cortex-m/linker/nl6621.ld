/*
 * Linker script for nl6621.
 * 64K fixed ROM, 192K code SRAM, 96K shared data SRAM, 96K and 64K 
 * buffer SRAM.
 */

/* Define memory regions. */
MEMORY
{
    /* 64K fixed ROM, contains precompiled SDK */
    rom (rx)        : ORIGIN = 0x0,        LENGTH = 0x10000

    /* 192K code SRAM, first 256 bytes used for FW image header */
    sram_code (rx)  : ORIGIN = 0x10100,    LENGTH = 0x2FF00

    /* 2K function hook table for SDK in ROM  */
    rom_tbl(rw)     : ORIGIN = 0x80000,    LENGTH = 0x800

    /* 94K shared data SRAM */
	sram_data (rwx) : ORIGIN = 0x80800,    LENGTH = 0x17800

    /* 96K buffer memory SRAM ("ping_mem_pool") */ 
    sram_buf0 (rwx) : ORIGIN = 0x20000000, LENGTH = 0x18000

    /* 64K buffer memory SRAM ("pong_mem_pool") */ 
    sram_buf1 (rwx) : ORIGIN = 0x20040000, LENGTH = 0x10000
}

/* Include the common ld script. */
INCLUDE libopencm3_nl6621.ld

