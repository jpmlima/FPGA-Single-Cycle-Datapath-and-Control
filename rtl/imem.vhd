-- Instruction ROM with a registered output (acts as the instruction register).
-- Holds 2**ADDR_BITS words; addresses wrap around. Unused words are NOPs.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cpu_pkg.all;

entity imem is
  generic (
    ADDR_BITS : positive := 3;
    CONTENTS  : instr_mem_t
  );
  port (
    clk   : in  std_logic;
    en    : in  std_logic;
    addr  : in  word_t;
    instr : out instr_t
  );
end entity imem;

architecture rtl of imem is

  subtype rom_t is instr_mem_t(0 to 2 ** ADDR_BITS - 1);

  function init_rom(c : instr_mem_t) return rom_t is
    variable r : rom_t := (others => (others => '0'));
  begin
    assert c'length <= r'length
      report "imem: program does not fit in 2**ADDR_BITS words" severity failure;
    for i in c'range loop
      r(i - c'low) := c(i);
    end loop;
    return r;
  end function;

  constant ROM : rom_t := init_rom(CONTENTS);

begin

  process (clk)
  begin
    if rising_edge(clk) then
      if en = '1' then
        instr <= ROM(to_integer(unsigned(addr(ADDR_BITS - 1 downto 0))));
      end if;
    end if;
  end process;

end architecture rtl;
