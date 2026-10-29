-- Sign-extends an immediate to the datapath width.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extend is
  generic (
    IN_WIDTH  : positive := 7;
    OUT_WIDTH : positive := 8
  );
  port (
    din  : in  std_logic_vector(IN_WIDTH - 1 downto 0);
    dout : out std_logic_vector(OUT_WIDTH - 1 downto 0)
  );
end entity sign_extend;

architecture rtl of sign_extend is
begin
  dout <= std_logic_vector(resize(signed(din), OUT_WIDTH));
end architecture rtl;
