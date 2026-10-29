-- Combinational ALU. Multiplication keeps the low WIDTH bits of the product.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cpu_pkg.all;

entity alu is
  generic (
    WIDTH : positive := DATA_WIDTH
  );
  port (
    alu_op : in  alu_op_t;
    a      : in  std_logic_vector(WIDTH - 1 downto 0);
    b      : in  std_logic_vector(WIDTH - 1 downto 0);
    result : out std_logic_vector(WIDTH - 1 downto 0);
    eq     : out std_logic   -- a = b, used to resolve BEQ
  );
end entity alu;

architecture rtl of alu is

  function flag(cond : boolean) return std_logic_vector is
    variable r : std_logic_vector(WIDTH - 1 downto 0) := (others => '0');
  begin
    if cond then
      r(0) := '1';
    end if;
    return r;
  end function;

begin

  process (alu_op, a, b)
    variable sa, sb  : signed(WIDTH - 1 downto 0);
    variable ua, ub  : unsigned(WIDTH - 1 downto 0);
    variable prod_s  : signed(2 * WIDTH - 1 downto 0);
    variable prod_u  : unsigned(2 * WIDTH - 1 downto 0);
    variable shamt   : natural;
  begin
    sa    := signed(a);
    sb    := signed(b);
    ua    := unsigned(a);
    ub    := unsigned(b);
    shamt := to_integer(ub);

    case alu_op is
      when ALU_ADD  => result <= std_logic_vector(sa + sb);
      when ALU_SUB  => result <= std_logic_vector(sa - sb);
      when ALU_AND  => result <= a and b;
      when ALU_OR   => result <= a or b;
      when ALU_XOR  => result <= a xor b;
      when ALU_NOR  => result <= a nor b;
      when ALU_MULU =>
        prod_u := ua * ub;
        result <= std_logic_vector(prod_u(WIDTH - 1 downto 0));
      when ALU_MUL  =>
        prod_s := sa * sb;
        result <= std_logic_vector(prod_s(WIDTH - 1 downto 0));
      when ALU_SLL  => result <= std_logic_vector(shift_left(ua, shamt));
      when ALU_SRL  => result <= std_logic_vector(shift_right(ua, shamt));
      when ALU_SRA  => result <= std_logic_vector(shift_right(sa, shamt));
      when ALU_SEQ  => result <= flag(ua = ub);
      when ALU_SLT  => result <= flag(sa < sb);
      when ALU_SLTU => result <= flag(ua < ub);
      when ALU_SGT  => result <= flag(sa > sb);
      when ALU_SGTU => result <= flag(ua > ub);
      when others   => result <= (others => '0');
    end case;
  end process;

  eq <= '1' when a = b else '0';

end architecture rtl;
