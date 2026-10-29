-- Two-input multiplexer.
library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
  generic (
    WIDTH : positive := 8
  );
  port (
    sel : in  std_logic;
    d0  : in  std_logic_vector(WIDTH - 1 downto 0);
    d1  : in  std_logic_vector(WIDTH - 1 downto 0);
    y   : out std_logic_vector(WIDTH - 1 downto 0)
  );
end entity mux2;

architecture rtl of mux2 is
begin
  y <= d1 when sel = '1' else d0;
end architecture rtl;
