-- Default memory contents: a short program that exercises loads, stores,
-- arithmetic and both outcomes of BEQ. See docs/isa.md for the encoding.
library ieee;
use ieee.std_logic_1164.all;

use work.cpu_pkg.all;

package program_pkg is

  constant PROGRAM : instr_mem_t := (
    0 => x"E180",  -- lw   r3, 0(r0)       r3 <- mem[0] = 4
    1 => x"E201",  -- lw   r4, 1(r0)       r4 <- mem[1] = 4
    2 => x"4E01",  -- beq  r3, r4, +1      taken: skip next instruction
    3 => x"2E51",  -- sub  r5, r3, r4      (skipped)
    4 => x"C202",  -- sw   r4, 2(r0)       mem[2] <- 4
    5 => x"5601",  -- beq  r5, r4, +1      not taken (0 /= 4)
    6 => x"2E51",  -- sub  r5, r3, r4      r5 <- 0
    7 => x"C283"   -- sw   r5, 3(r0)       mem[3] <- 0
  );

  constant DATA_INIT : data_mem_t := (
    0 => x"04",
    1 => x"04",
    2 => x"05",
    3 => x"06"
  );

end package program_pkg;
