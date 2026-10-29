-- Program counter with asynchronous reset, increment and parallel load.
-- Increment has priority over load.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is
  generic (
    WIDTH : positive := 8
  );
  port (
    clk     : in  std_logic;
    rst     : in  std_logic;
    inc     : in  std_logic;
    load    : in  std_logic;
    next_pc : in  std_logic_vector(WIDTH - 1 downto 0);
    pc      : out std_logic_vector(WIDTH - 1 downto 0)
  );
end entity pc;

architecture rtl of pc is
  signal count : unsigned(WIDTH - 1 downto 0);
begin

  process (clk, rst)
  begin
    if rst = '1' then
      count <= (others => '0');
    elsif rising_edge(clk) then
      if inc = '1' then
        count <= count + 1;
      elsif load = '1' then
        count <= unsigned(next_pc);
      end if;
    end if;
  end process;

  pc <= std_logic_vector(count);

end architecture rtl;
