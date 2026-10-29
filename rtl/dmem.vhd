-- Data RAM: asynchronous read, synchronous write.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cpu_pkg.all;

entity dmem is
  generic (
    INIT : data_mem_t
  );
  port (
    clk  : in  std_logic;
    we   : in  std_logic;
    addr : in  word_t;
    wd   : in  word_t;
    rd   : out word_t
  );
end entity dmem;

architecture rtl of dmem is

  subtype ram_t is data_mem_t(0 to 2 ** DATA_WIDTH - 1);

  function init_ram(c : data_mem_t) return ram_t is
    variable r : ram_t := (others => (others => '0'));
  begin
    for i in c'range loop
      r(i - c'low) := c(i);
    end loop;
    return r;
  end function;

  signal ram : ram_t := init_ram(INIT);

begin

  process (clk)
  begin
    if rising_edge(clk) then
      if we = '1' then
        ram(to_integer(unsigned(addr))) <= wd;
      end if;
    end if;
  end process;

  rd <= ram(to_integer(unsigned(addr)));

end architecture rtl;
