-- Register file: two asynchronous read ports, one synchronous write port.
-- Register 0 always reads as zero.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cpu_pkg.all;

entity reg_file is
  port (
    clk : in  std_logic;
    ra1 : in  reg_addr_t;
    ra2 : in  reg_addr_t;
    rd1 : out word_t;
    rd2 : out word_t;
    we  : in  std_logic;
    wa  : in  reg_addr_t;
    wd  : in  word_t
  );
end entity reg_file;

architecture rtl of reg_file is
  signal regs : data_mem_t(0 to 2 ** REG_ADDR_WIDTH - 1) := (others => (others => '0'));
begin

  process (clk)
  begin
    if rising_edge(clk) then
      if we = '1' and unsigned(wa) /= 0 then
        regs(to_integer(unsigned(wa))) <= wd;
      end if;
    end if;
  end process;

  rd1 <= regs(to_integer(unsigned(ra1)));
  rd2 <= regs(to_integer(unsigned(ra2)));

end architecture rtl;
